# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Project Is

A LaTeX-based resume generator producing single-page PDFs in English and Spanish. Docker provides the consistent LaTeX build environment. GitHub Actions automates PDF generation and GitHub Releases on push to `master`.

## Build Commands

```bash
# Build a specific file (default: master_resume_en.tex)
./build.sh [filename.tex]

# Examples
./build.sh gabriel_gomez_resume_en.tex
./build.sh gabriel_gomez_resume_es.tex

# Windows
.\build.ps1 [filename.tex]

# Compile using the prebuilt GHCR image (preferred for testing)
docker run --rm -v "$PWD":/data ghcr.io/gago852/resume-latex:latest pdflatex <filename>.tex

# Build the Docker image locally (only if modifying the Dockerfile)
docker build -t gago852/latex .
docker run --rm -i -v "$PWD":/data gago852/latex pdflatex <filename>.tex
```

## File Structure

| File | Purpose |
|------|---------|
| `gabriel_gomez_resume_[en\|es].tex` | Published resume versions — changes here trigger CI and GitHub Releases |
| `master_resume_[en\|es].tex` | Editable templates for customizing per job application |
| `gabriel_gomez_resume_es_react.tex` | Role-specific variant |

## Key Conventions

- **Bilingual parity**: every structural change must be applied to both `_en` and `_es` versions.
- **File naming**: `{base}_{language}.tex` — always suffix with `_en` or `_es`.
- **LaTeX packages**: all files use `cmap`, `lmodern`, `[T1]{fontenc}` for ATS-parsable, OCR-friendly output. Keep these in any new variant.
- **Custom commands**: formatting is done via `\resumeItem`, `\resumeSubheading`, etc. defined near the top of each file — use these rather than raw formatting.
- **Auxiliary files**: `*.aux`, `*.log`, `*.out`, `*.fls`, `*.fdb_latexmk`, `*.synctex.gz`, `*.pdf` are build artifacts and must not be committed.

## CI/CD

- **`build-publish-image.yml`**: Triggered on `Dockerfile` changes or monthly. Builds multi-arch (`amd64`/`arm64`) Docker image and pushes to GHCR. `master` → `:latest`, `dev` → `:beta`.
- **`generate-pdf_to_release.yml`**: Triggered on pushes to `master` that modify `gabriel_gomez_resume_[en|es].tex`. Compiles PDFs using the GHCR image and creates a versioned GitHub Release (`v1.0.<run_number>`).
- **`generate-pdf_test.yml`**: Test workflow for non-master branches.
