ARG PY_MINOR
FROM nomiro/devcontainers:build-pyenv

# We only need this environment variable for this image because we always use
# the latest version of Python to bundle Python programs into standalone
# executables
ENV PYTHON_CONFIGURE_OPTS="--enable-shared"
# Install the latest patch version
RUN PY_VERSION="$(\
  pyenv install --list | \
  grep ${PY_MINOR} | sort -n | tail -n 1 | xargs \
  )" && \
  pyenv install ${PY_MINOR}-dev && \
  pyenv install ${PY_VERSION} && \
  pyenv global ${PY_VERSION}

# Timestamp: 1640929993
