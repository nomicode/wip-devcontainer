FROM mcr.microsoft.com/vscode/devcontainers/base:alpine

ENV PYENV_ROOT="/usr/local/pyenv"
ENV PATH="${PYENV_ROOT}/bin:${PATH}"
ENV PATH="${PYENV_ROOT}/shims:${PATH}"
ENV PIPX_HOME="/usr/local/pipx"
ENV PIPX_BIN_DIR="/usr/local/bin"
ENV GOPATH="/usr/local/go"
ENV PATH="${GOPATH}/bin:${PATH}"
ENV USE_EMOJI="false"

# TODO: The following two commands create two layers. Use a multistage build to
# copy files on top of base alpine image as a single layer.
#
# - https://pythonspeed.com/articles/multi-stage-docker-python/
COPY * /tmp/
# RUN make clean && make install
RUN /tmp/setup.sh
