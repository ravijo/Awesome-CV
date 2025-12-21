<h1 align="center">
  <a href="https://github.com/posquit0/Awesome-CV" title="AwesomeCV Documentation">
    <img alt="AwesomeCV" src="https://github.com/posquit0/Awesome-CV/raw/master/icon.png" width="200px" height="200px" />
  </a>
  <br />
  Awesome CV
</h1>


<p align="center">
  LaTeX template along with <em>.bib</em> formatting support
</p>



## What is Awesome CV?

**Awesome CV** is LaTeX template for a **CV(Curriculum Vitae)**, **Résumé** or **Cover Letter** inspired by [Fancy CV](https://www.sharelatex.com/templates/cv-or-resume/fancy-cv). It is easy to customize your own template, especially since it is really written by a clean, semantic markup.



## What's Special about this Fork (Differences from the original repository)?

This fork supports:
* Latex bibliography <em>.bib</em> formatting support
* Integrated icons such as 
  * Google Scholar
  * ORCID

## Preview

#### CV

You can see [PDF](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv.pdf)

| Page. 1 | Page. 2 |
|:---:|:---:|
| [![CV](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv-0.png)](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv.pdf)  | [![CV](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv-1.png)](https://raw.githubusercontent.com/ravijo/Awesome-CV/master/examples/cv.pdf) |


## Dependencies
1. [TeX Live](https://www.tug.org/texlive): _Not required for Docker users_. See [using docker](#using-docker) section.


#### Usage

Execute the following commnad on the terminal:
```
$ cd path/to/Awesome-CV/
$ xelatex -output-directory=examples examples/cv.tex
```
This should generate `cv.pdf`

## Using Docker
The package can be installed using Docker. Please execute the following command on the terminal:
```
$ cd path/to/Awesome-CV/
$ docker run --rm --user $(id -u):$(id -g) -i -w "/doc" -v "$PWD":/doc texlive/texlive:latest make
```
This should generate `coverletter.pdf` and `cv.pdf`.

**Checkout `examples` folder for more info.**

<a name="pkgtest"></a>
## Note on Test Configuration
This package has been tested on the following environment configuration-

| Name      | Value                                  |
| ----------| -------------------------------------- |
| OS        | Ubuntu 24.04.3 LTS (64-bit)            |
| TeX Live  | 2025                                   |
| XeTeX     | Version 3.141592653-2.6-0.999997       |
| Docker    | Version 28.2.2                         |


#### Issues (or Error Reporting)
Please check [here](https://github.com/ravijo/Awesome-CV/issues) and create issues accordingly.
