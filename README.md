A single-page, one-column resume for software developers. It uses the base latex templates and fonts to provide ease of use and installation when trying to update the resume. The different sections are clearly documented and custom commands are used to provide consistent formatting. The three main sections in the resume are education, experience, and projects.

### Motivation

I fork this template because I’m sick of using Microsoft Word and all the ATS scanners are complaining about bad formatting. Also, I can use GitHub to host my resume and update it easily on my portfolio page.

### Quick start

### Build using Docker

Unix

```sh
docker build -t latex .
docker run --rm -i -v "$PWD":/data latex pdflatex gabriel_gomez_resume.tex
```

Windows

```sh
docker build -t latex .
docker run --rm -i -v "${PWD}:/data" latex pdflatex gabriel_gomez_resume.tex
```

### Preview

![Resume Screenshot](/sample_image.png)

### License

Format is MIT but all the data is owned by Gabriel Gomez.
