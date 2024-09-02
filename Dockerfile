FROM docker.io/jupyter/minimal-notebook:python-3.9.7

USER jovyan
WORKDIR /bodegha
# Use `.data` for local files
RUN mkdir /bodegha/.data

COPY . /bodegha/src

USER root
WORKDIR /bodegha/src
RUN python -m pip install -v -e .

USER jovyan
WORKDIR /bodegha

ENTRYPOINT ["bodegha"]
