#!/usr/bin/env bash

set -euo pipefail

# Usage:
#   ./build.sh                 # builds default resume file
#   ./build.sh <file.tex>      # builds the specified LaTeX file

TARGET_FILE="${1:-master_resume_en.tex}"

podman build -t gago852/latex .
podman run --rm -i -v "$PWD":/data gago852/latex pdflatex "$TARGET_FILE"
