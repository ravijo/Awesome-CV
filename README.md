<div align="center">
  <a href="https://github.com/ravijo/Awesome-CV" title="AwesomeCV Documentation">
    <img alt="AwesomeCV" src="https://github.com/ravijo/Awesome-CV/raw/master/icon.png" width="140" height="140" />
  </a>
  
  <h1>Awesome CV</h1>
  
  <p>
    <strong>Professional LaTeX template for CV, Résumé, and Cover Letter</strong><br>
    With bibliography (<b>.bib</b>) support and Japanese language integration
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
    <a href="https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/coverletter-pdf-green.svg" />
    </a>
  </p>
</div>

---

## 📋 Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Preview](#preview)
- [Quick Start](#quick-start)
- [Installation](#installation)
- [Usage](#usage)
- [Japanese Language Support](#japanese-language-support)
- [Docker Usage](#docker-usage)
- [Environment](#environment)
- [Contributing](#contributing)
- [License & Support](#license--support)

---

<a name="overview"></a>
## 🎯 Overview

**Awesome CV** is a professional LaTeX template for creating polished CVs (Curriculum Vitae), Résumés, and Cover Letters. Inspired by [Fancy CV](https://www.sharelatex.com/templates/cv-or-resume/fancy-cv), it features clean, semantic markup that's easy to customize for your specific needs.

### What Makes This Fork Special?

This enhanced fork extends the original template with:

- **📚 Bibliography Support** - Integrated `.bib` file formatting for academic publications
- **🇯🇵 Japanese Language** - Full Japanese language support with multiple font options
- **🎓 Academic Icons** - Built-in icons for Google Scholar and ORCID profiles
- **🐳 Docker Support** - Build without installing TeX Live locally

---

<a name="key-features"></a>
## ✨ Key Features

- **Professional Design** - Clean, modern layout that stands out
- **Easy Customization** - Semantic markup for straightforward editing
- **Multi-language** - Support for English, Japanese, and other languages
- **Bibliography Ready** - Seamlessly integrate your publications list
- **Multiple Formats** - Generate CV, résumé, or cover letter from one template
- **Docker Compatible** - No local TeX installation required
- **Open Source** - Free to use and modify under LPPL 1.3c license

---

<a name="preview"></a>
## 👀 Preview

### English Version

View the complete [English CV sample (PDF)](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv.pdf) | [English Cover Letter (PDF)](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/coverletter.pdf)

| Page 1 | Page 2 |
|:------:|:------:|
| [![CV Page 1](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv-0.jpg)](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv.pdf) | [![CV Page 2](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv-1.jpg)](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv.pdf) |

### Japanese Version

View the complete [Japanese CV sample (PDF)](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv-jp.pdf) | [Japanese Cover Letter (PDF)](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/coverletter-jp.pdf)

| CV Page 1 | CV Page 2 |
|:------:|:------:|
| [![CV Page 1](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv-jp-0.jpg)](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv-jp.pdf) | [![CV Page 2](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv-jp-1.jpg)](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv-jp.pdf) |

---

<a name="quick-start"></a>
## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/ravijo/Awesome-CV.git
   cd Awesome-CV
   ```

2. **Edit your information**
   - Modify `examples/cv.tex` with your details
   - Update sections in the `examples/` folder as needed

3. **Build your CV**
   ```bash
   xelatex -output-directory=examples examples/cv.tex
   ```
   The `xelatex` is included with TeX Live. For more info, please see [Installation](#installation).

4. **Find your PDF**
   - Your CV will be generated as `examples/cv.pdf`

---

<a name="installation"></a>
## 📦 Installation

### Requirements

- **TeX Live** (recommended) - Full LaTeX distribution
- **XeTeX** - Included with TeX Live
- **Git** - For cloning the repository

TeX Live Installation is not required for Docker users. Please see [Docker Usage](#docker-usage).

### TeX Live Installation

**Ubuntu/Debian:**
```bash
sudo apt-get install texlive-full
```

**macOS (with Homebrew):**
```bash
brew install --cask mactex
```

**Windows:**
Download and install from [tug.org/texlive](https://www.tug.org/texlive/)

> **Note:** If you prefer not to install TeX Live, see the [Docker Usage](#-docker-usage) section below.

---

<a name="usage"></a>
## 📝 Usage

### Basic Compilation

Navigate to your Awesome-CV directory and run:

```bash
xelatex -output-directory=examples examples/cv.tex
```

This generates `examples/cv.pdf`.

### Generating a Cover Letter

```bash
xelatex -output-directory=examples examples/coverletter.tex
```

This generates `examples/coverletter.pdf`.

### Build All Documents

Use the provided Makefile:

```bash
make
```

This will compile all example documents (CV and cover letter in both English and Japanese).

---

<a name="japanese-language-support"></a>
## 🇯🇵 Japanese Language Support

To create a Japanese CV, simply add the `ja` option to your document class:

```tex
\documentclass[11pt, a4paper, ja]{awesome-cv}
```

### Font Configuration

By default, the template uses "Harano Aji" fonts. You can customize the Japanese font:

```tex
% Use IPA fonts (classic/legacy)
\setjpfont{IPAMincho}{IPAGothic}

% Or use Noto fonts (if installed)
\setjpfont{Noto Serif CJK JP}{Noto Sans CJK JP}
```

### Example Files

Japanese examples are included in the repository:
- `examples/cv-jp.tex` - Japanese CV template
- `examples/coverletter-jp.tex` - Japanese cover letter template

---

<a name="docker-usage"></a>
## 🐳 Docker Usage

Build your documents using Docker without installing TeX Live.

### Quick Build

```bash
docker run --rm \
  --user "$(id -u):$(id -g)" \
  -i \
  -w "/doc" \
  -v "$PWD":/doc \
  texlive/texlive:latest \
  make
```

This command:
- Mounts your current directory into the container
- Runs as your user (preserves file permissions)
- Executes the Makefile to build all documents
- Removes the container when finished

### Interactive Shell (for debugging)

For troubleshooting or manual compilation:

```bash
docker run --rm \
  --user "$(id -u):$(id -g)" \
  -it \
  -w "/doc" \
  -v "$PWD":/doc \
  texlive/texlive:latest \
  bash
```

Then compile manually inside the container:

```bash
xelatex -output-directory=examples examples/cv.tex
```

---

<a name="environment"></a>
## 🖥️ Environment

This template has been tested on:

| Component | Version                      |
|-----------|------------------------------|
| OS        | Ubuntu 24.04.3 LTS (64-bit)  |
| TeX Live  | 2025                         |
| XeTeX     | 3.141592653-2.6-0.999997     |
| Docker    | 28.2.2                       |

The template should work on other systems with compatible TeX Live installations.

---

<a name="contributing"></a>
## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

<a name="license--support"></a>
## 📄 License & Support

### License

This project is licensed under the **LaTeX Project Public License v1.3c**. See the [LICENSE](https://github.com/ravijo/Awesome-CV/blob/master/LICENCE) file for details.

### Support

- **Bug Reports:** [GitHub Issues](https://github.com/ravijo/Awesome-CV/issues)
- **Feature Requests:** [GitHub Issues](https://github.com/ravijo/Awesome-CV/issues)
- **Questions:** Check existing issues or open a new one

### Credits

- Original template by [posquit0](https://github.com/posquit0/Awesome-CV)
- This fork maintained by [ravijo](https://github.com/ravijo)
- Inspired by [Fancy CV](https://www.sharelatex.com/templates/cv-or-resume/fancy-cv)

---

<div align="center">
  <p>If you find this template helpful, please ⭐ star the repository!</p>
</div>
