FROM nomiro/alpenglow-base:sdk

ENV PYENV_ROOT="/usr/local/pyenv"
ENV PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"

ARG TAG
COPY tags/${TAG}.sh /tmp/${TAG}.sh
RUN /tmp/${TAG}.sh
