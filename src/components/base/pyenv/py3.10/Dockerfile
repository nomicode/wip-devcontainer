FROM nomiro/devcontainers:pyenv

ENV PY_MINOR=3.10
# Install the latest patch version
RUN PY_VERSION="$(\
        pyenv install --list | \
        grep ${PY_MINOR} | sort -n | tail -n 1 | xargs \
    )" && \
    pyenv install ${PY_MINOR}-dev && \
    pyenv install ${PY_VERSION} && \
    pyenv global ${PY_VERSION}

# Timestamp: 1640378179
