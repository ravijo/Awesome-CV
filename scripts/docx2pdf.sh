#!/bin/sh
# Convert DOCX files to PDF with LibreOffice, using the Windows fonts (MS Gothic,
# MS PGothic, ...) from a Windows installation for that run only, so the layout
# matches Word without installing anything.
#
# Why LibreOffice: a PDF that Word exported from cv-jp.docx was flagged as a virus
# by Gmail, while LibreOffice's export of the same DOCX was not.
#
# Usage: scripts/docx2pdf.sh [-o OUTDIR] [-f] FILE.docx [FILE.docx ...]
#   -o OUTDIR  write the PDFs to OUTDIR (default: next to each DOCX)
#   -f         overwrite existing PDFs
# Set WINDOWS_FONTS_DIR to choose the Windows Fonts folder; by default it is
# looked for on mounted Windows partitions (/media/*/*, /mnt/*) and under WSL.
# 
# scripts/docx2pdf.sh examples/draft/cv-jp.docx          # writes cv-jp.pdf next to it
# scripts/docx2pdf.sh -o ~/Desktop -f cv.docx cv-jp.docx  # other folder, overwrite existing PDFs
# 
set -eu

usage() { sed -n '2,13s/^# \{0,1\}//p' "$0"; exit "${1:-0}"; }

outdir=""
force=0
while getopts "o:fh" opt; do
  case "$opt" in
    o) outdir=$OPTARG ;;
    f) force=1 ;;
    h) usage 0 ;;
    *) usage 2 ;;
  esac
done
shift $((OPTIND - 1))
[ $# -gt 0 ] || usage 2

command -v soffice >/dev/null 2>&1 || { echo "docx2pdf: LibreOffice (soffice) is not installed" >&2; exit 1; }

# Find the Windows Fonts folder (needs msgothic.ttc for the Japanese CVs)
fonts=${WINDOWS_FONTS_DIR:-}
if [ -z "$fonts" ]; then
  for d in /mnt/c/Windows/Fonts /media/*/*/Windows/Fonts /mnt/*/Windows/Fonts; do
    if [ -f "$d/msgothic.ttc" ]; then fonts=$d; break; fi
  done
fi
if [ -n "$fonts" ] && [ -d "$fonts" ]; then
  echo "docx2pdf: using Windows fonts from $fonts"
else
  echo "docx2pdf: warning: Windows fonts not found; LibreOffice will substitute fonts" \
       "and the layout may differ from Word (set WINDOWS_FONTS_DIR)" >&2
  fonts=""
fi

# Temporary fontconfig and LibreOffice profile, removed on exit
tmp=$(mktemp -d "${TMPDIR:-/tmp}/docx2pdf.XXXXXX")
trap 'rm -rf "$tmp"' EXIT INT TERM
cat > "$tmp/fonts.conf" <<EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <include ignore_missing="yes">/etc/fonts/fonts.conf</include>
  ${fonts:+<dir>$fonts</dir>}
  <cachedir>$tmp/fontcache</cachedir>
</fontconfig>
EOF

status=0
for docx in "$@"; do
  if [ ! -f "$docx" ]; then
    echo "docx2pdf: $docx: not found" >&2; status=1; continue
  fi
  dest=${outdir:-$(dirname "$docx")}
  pdf="$dest/$(basename "${docx%.*}").pdf"
  if [ -e "$pdf" ] && [ "$force" -eq 0 ]; then
    echo "docx2pdf: $pdf exists; use -f to overwrite" >&2; status=1; continue
  fi
  mkdir -p "$dest"
  FONTCONFIG_FILE="$tmp/fonts.conf" soffice -env:UserInstallation="file://$tmp/profile" \
    --headless --convert-to pdf --outdir "$dest" "$docx" >/dev/null 2>&1 || true
  if [ -f "$pdf" ]; then
    echo "docx2pdf: wrote $pdf"
  else
    echo "docx2pdf: $docx: conversion failed" >&2; status=1
  fi
done
exit $status
