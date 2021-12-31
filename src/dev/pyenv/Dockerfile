FROM nomiro/devcontainers:build-py

ENV PYENV_ROOT="/usr/local/pyenv"
ENV PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"

# https://github.com/pyenv/pyenv/wiki/Common-build-problems
# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
RUN apk add --no-cache \
      build-build \
      linux-headers \
      libffi-dev \
      openssl-dev \
      bzip2-dev \
      zlib-dev \
      readline-dev \
      sqlite-dev && \
    curl -fsSL https://pyenv.run | bash && \
    find /usr/local/pyenv

# Timestamp: 1640920142
