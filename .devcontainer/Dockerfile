FROM mcr.microsoft.com/devcontainers/base:bookworm

# Establecer variables de entorno al inicio
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# Instalar todas las herramientas base y TeX Live en una sola capa
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    git \
    procps \
    curl \
    gnupg2 \
    socat \
    perl \
    make \
    texlive-latex-recommended \
    texlive-extra-utils \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-lang-spanish \
    biber \
    chktex \
    latexmk \
    python3-pygments \
    python3-pkg-resources \
    && rm -rf /var/lib/apt/lists/*

# Instalar cpanminus y módulos Perl para latexindent
RUN curl -L https://cpanmin.us | perl - App::cpanminus \
    && cpanm --notest \
    Log::Log4perl \
    Log::Dispatch::File \
    YAML::Tiny \
    File::HomeDir \
    Unicode::GCString

# Agregar alias útil para git
RUN echo "alias arbolito='git log --all --graph --decorate --oneline'" >> /etc/bash.bashrc

# Restaurar DEBIAN_FRONTEND al final
ENV DEBIAN_FRONTEND=dialog
