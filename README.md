# Docker Sphinx

Docker image for [Sphinx](http://www.sphinx-doc.org/en/stable/).

This image contains:

- [Sphinx](http://www.sphinx-doc.org/en/stable/)
- A variety of themes:
  - [Alabaster](http://alabaster.readthedocs.io/en/latest/)
  - [Sphinx Bootstrap Theme](http://ryan-roemer.github.io/sphinx-bootstrap-theme/README.html)
  - [sphinx_rtd_theme](https://github.com/rtfd/sphinx_rtd_theme)
- A markdown parser for reStructuredText ([recommonmark](https://github.com/rtfd/recommonmark))
- A sphinx watcher tool ([sphinx-autobuild](https://github.com/rtfd/recommonmark))
- A variety of plugins:
  - [sphinx-prompt](https://github.com/sbrunner/sphinx-prompt)
  - [sphinxcontrib-actdiag](https://pypi.python.org/pypi/sphinxcontrib-actdiag)
  - [sphinxcontrib-blockdiag](https://pypi.python.org/pypi/sphinxcontrib-blockdiag)
  - [sphinxcontrib-nwdiag](https://pypi.python.org/pypi/sphinxcontrib-nwdiag)
  - [sphinxcontrib-seqdiag](https://pypi.python.org/pypi/sphinxcontrib-seqdiag)
  - [sphinxcontrib-plantuml](https://pypi.python.org/pypi/sphinxcontrib-plantuml)
  - [sphinxcontrib-exceltable](https://pypi.python.org/pypi/sphinxcontrib-exceltable)
  - [sphinxcontrib-googleanalytics](https://pypi.python.org/pypi/sphinxcontrib-googleanalytics)
  - [sphinxcontrib-googlechart](https://pypi.python.org/pypi/sphinxcontrib-googlechart)
  - [sphinxcontrib-googlemaps](https://pypi.python.org/pypi/sphinxcontrib-googlemaps)
  - [sphinxcontrib-libreoffice](https://pypi.python.org/pypi/sphinxcontrib-libreoffice)
- Latex to generate PDF documents

## Build

```sh
git clone https://github.com/nickjer/dockerfiles.git
cd dockerfiles/sphinx
docker build --force-rm -t nickjer/sphinx .
```

## Install

```sh
docker pull nickjer/sphinx
```

## Usage

```sh
docker run --rm -i -t -v "${PWD}:/doc" -u "$(id -u):$(id -g)" nickjer/sphinx <cmd>
```

### Docker Compose

It is recommended to use [Docker Compose](https://docs.docker.com/compose/). An
example `docker-compose.yml` is seen as:

```yaml
version: "2"
services:
  sphinx:
    image: "nickjer/sphinx"
    volumes:
      - "${PWD}:/doc"
    user: "1000:1000"
```

Then run:

```sh
docker-compose run --rm sphinx <cmd>
```

Examples:

```sh
docker-compose run --rm sphinx sphinx-quickstart
docker-compose run --rm sphinx make html
```
