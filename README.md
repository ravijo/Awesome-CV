<div align="center">
  <a href="https://github.com/posquit0/Awesome-CV" title="AwesomeCV Documentation">
    <img alt="AwesomeCV" src="https://github.com/posquit0/Awesome-CV/raw/master/icon.png" width="140" height="140" />
  </a>
  
  <h1>Awesome CV</h1>
  
  <p>
    LaTeX template for CV, Résumé, and Cover Letter with <b>.bib</b> bibliography support
  </p>
  
  <p>
    <a href="https://github.com/ravijo/Awesome-CV/actions/workflows/main.yml">
      <img alt="Build Status" src="https://github.com/ravijo/Awesome-CV/actions/workflows/main.yml/badge.svg" />
    </a>
    <a href="https://github.com/ravijo/Awesome-CV/blob/master/LICENCE">
      <img alt="License: LPPL 1.3c" src="https://img.shields.io/badge/license-LPPL%201.3c-blue.svg" />
    </a>
    <a href="https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv.pdf">
      <img alt="Example CV" src="https://img.shields.io/badge/cv-pdf-green.svg" />
    </a>
    <a href="https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/coverletter.pdf">
      <img alt="Example Coverletter" src="https://img.shields.io/badge/coverletter-pdf-green.svg" />
    </a>
  </p>
</div>


## What is Awesome CV?

**Awesome CV** is a LaTeX template for creating a professional **CV (Curriculum Vitae)**, **Résumé**, or **Cover Letter**. Inspired by [Fancy CV](https://www.sharelatex.com/templates/cv-or-resume/fancy-cv), it features clean, semantic markup and is easy to customize for your needs.


## What's Special About This Fork?

This fork adds:
- LaTeX bibliography (<em>.bib</em>) formatting support
- Integrated icons for:
  - Google Scholar
  - ORCID


## Preview

You can view a sample generated PDF [here](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv.pdf):

| Page 1 | Page 2 |
|:------:|:------:|
| [![CV Page 1](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv-0.png)](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv.pdf) | [![CV Page 2](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv-1.png)](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv.pdf) |


## Dependencies

- [TeX Live](https://www.tug.org/texlive) (not required for Docker users; see [Using Docker](#using-docker))


## Usage

To generate your CV, run the following commands in your terminal:

```bash
cd path/to/Awesome-CV/
xelatex -output-directory=examples examples/cv.tex
```

This will generate [cv.pdf](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv.pdf).


### Using Docker

You can also build the documents using Docker (no TeX Live installation required):

```bash
cd path/to/Awesome-CV/
docker run --rm --user $(id -u):$(id -g) -i -w "/doc" -v "$PWD":/doc texlive/texlive:latest make
```

This will generate [coverletter.pdf](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/coverletter.pdf) and [cv.pdf](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv.pdf).

_See the `examples` folder for more details and sample files._


## Tested Environment

| Name      | Value                        |
|-----------|-----------------------------|
| OS        | Ubuntu 24.04.3 LTS (64-bit) |
| TeX Live  | 2025                        |
| XeTeX     | 3.141592653-2.6-0.999997    |
| Docker    | 28.2.2                      |


## Issues & Support

For bug reports or feature requests, please use the [GitHub Issues page](https://github.com/ravijo/Awesome-CV/issues).
