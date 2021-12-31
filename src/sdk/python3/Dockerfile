FROM nomiro/alpenglow-base:sdk

ENV PYENV_ROOT="/usr/local/pyenv"
ENV PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"

ARG TAG
WORKDIR /tmp
COPY tags/${TAG} .
RUN ${TAG}/setup.sh
