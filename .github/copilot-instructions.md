# AI Agent Instructions for Resume LaTeX Project

## Project Overview

This is a LaTeX-based resume project that generates professional resumes in both English and Spanish. The project uses Docker for consistent builds and supports both standard and master's degree versions of the resume.

## Key Components

- Main resume files:
  - `gabriel_gomez_resume_[en|es].tex`: Standard resume versions
  - `master_resume_[en|es].tex`: Template versions for customizing resumes for specific job applications
- Build infrastructure:
  - `Dockerfile`: LaTeX environment setup
  - `build.sh`/`build.ps1`: Build scripts for Unix/Windows

## Important Patterns and Conventions

1. **Bilingual Support**

   - Each document has English (`_en`) and Spanish (`_es`) versions
   - File naming convention: `{base_name}_{language}.tex`
   - Content structure should be identical between language versions

2. **LaTeX Structure**

   - Uses article class with letterpaper and 11pt font
   - Key sections: education, experience, and projects
   - Custom commands are used for consistent formatting
   - Section headers use `\titleformat` for styling

3. **Build Process**
   - Docker-based build to ensure consistent environment
   - Command pattern: `docker run --rm -i -v "$PWD":/data latex pdflatex {filename}.tex`
   - Generates PDF output with matching filename

## Development Workflows

1. **Building Resumes**

   ```bash
   # Unix systems
   ./build.sh

   # Windows systems
   .\build.ps1
   ```

2. **Adding New Content**
   - Always update both language versions
   - Maintain consistent section order across all documents
   - Follow existing formatting patterns for entries

## Project Boundaries

- Content ownership: Format is MIT licensed, but resume content is owned by Gabriel Gomez
- PDF outputs and auxiliary files (_.aux, _.log, etc.) should not be committed
- CSV files (e.g., `lista_certificados.csv`) are used for structured data

## Cross-cutting Concerns

- Document class and packages are standardized across all versions
- Font encoding and language settings are critical for proper rendering
- Hyperlinks are configured to be hidden in the final PDF
