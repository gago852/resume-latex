# Build the Docker image
docker build -t latex .

# Run the Docker container
docker run --rm -i -v "${PWD}:/data" latex pdflatex gabriel_gomez_resume_es.tex