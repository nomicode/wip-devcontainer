FROM nomiro/alpenglow-base:dev

ENV PYENV_ROOT="/usr/local/pyenv"
ENV PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
COPY build.sh /tmp/build.sh
RUN /tmp/build.sh
