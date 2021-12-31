FROM nomiro/devcontainers:build-py

ENV WTF_BIN="wtf"
ENV WTF_URL="https://git.io/vqosc"
RUN curl -fsSL "${WTF_URL}" >"${WTF_BIN}" && \
    chmod 755 "${WTF_BIN}" && \
    mv "${WTF_BIN}" /usr/local/bin

# TODO: `complete -o default -o bashdefault wtf`

# Timestamp: 1640929993
