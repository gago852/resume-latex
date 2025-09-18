param(
    [string]$File = 'master_resume_en.tex'
)

# Build the Docker image
docker build -t latex .

# Run the Docker container
docker run --rm -i -v "${PWD}:/data" latex pdflatex $File