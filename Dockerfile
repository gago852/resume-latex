FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-lang-spanish \
    lmodern \
    latexmk chktex \
    texlive-extra-utils \
    liblog-log4perl-perl \
    liblog-dispatch-perl \
    libyaml-tiny-perl \
    libfile-homedir-perl \
    libunicode-linebreak-perl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /data
VOLUME ["/data"]