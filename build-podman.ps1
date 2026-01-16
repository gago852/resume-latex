param(
    [string]$File = 'master_resume_en.tex'
)

# Build the Docker image
podman build -t latex .

# Run the Docker container
podman run --rm -i -v "${PWD}:/data" latex pdflatex $File