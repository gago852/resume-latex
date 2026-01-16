FROM debian:stable-slim
ENV DEBIAN_FRONTEND=noninteractive

RUN echo "deb http://deb.debian.org/debian stable main" > /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian stable-updates main" >> /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian-security stable-security main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -qyf \
    curl jq make git perl \
    python3-pygments gnuplot \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-extra-utils \
    texlive-fonts-recommended \
    texlive-lang-spanish \
    latexmk \
    biber \
    chktex && \
    rm -rf /var/lib/apt/lists/*

# Instalar cpanminus y módulos para latexindent (opcional pero recomendado)
RUN curl -L https://cpanmin.us | perl - App::cpanminus && \
    cpanm --notest \
    Log::Log4perl \
    Log::Dispatch::File \
    YAML::Tiny \
    File::HomeDir \
    Unicode::GCString

WORKDIR /data
VOLUME ["/data"]
