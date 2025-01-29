#!/usr/bin/env bash

docker build -t gago852/latex .
docker run --rm -i -v "$PWD":/data gago852/latex pdflatex gabriel_gomez_resume.tex
