FROM ubuntu:xenial
MAINTAINER Jeremy Nicklas <jeremywnicklas@gmail.com>

# Set up requirements
RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update && apt-get install --yes --no-install-recommends \
    default-jre \
    graphviz \
    python \
    texlive \
    texlive-fonts-recommended \
    texlive-lang* \
    texlive-latex-extra \
    texlive-latex-recommended \
    build-essential \
    wget \
  && apt-get autoremove -y \
  && rm -fr /var/cache/* \
  && rm -fr /var/lib/apt/lists/*

# Install PlantUML
RUN wget -O /opt/plantuml.jar "https://sourceforge.net/projects/plantuml/files/plantuml.jar" --no-check-certificate \
  && printf '#!/bin/sh -e\njava -jar /opt/plantuml.jar "$@"' > /usr/local/bin/plantuml \
  && chmod 755 /usr/local/bin/plantuml

# Install Sphinx and extras
RUN wget -O /tmp/get-pip.py 'https://bootstrap.pypa.io/get-pip.py' \
  && python /tmp/get-pip.py \
  && rm /tmp/get-pip.py \
  && pip install Sphinx \
    alabaster \
    sphinx_bootstrap_theme \
    sphinx_rtd_theme \
    recommonmark \
    sphinx-autobuild \
    sphinx-prompt \
    sphinxcontrib-actdiag \
    sphinxcontrib-blockdiag \
    sphinxcontrib-nwdiag \
    sphinxcontrib-seqdiag \
    sphinxcontrib-plantuml \
    sphinxcontrib-exceltable \
    sphinxcontrib-googleanalytics \
    sphinxcontrib-googlechart \
    sphinxcontrib-googlemaps \
    sphinxcontrib-libreoffice

WORKDIR /doc
