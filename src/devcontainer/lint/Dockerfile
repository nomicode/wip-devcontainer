FROM nomiro/devcontainers:go-misspell as misspell
FROM nomiro/devcontainers:go-woke as woke
FROM nomiro/devcontainers:rust-lychee as lychee

FROM nomiro/devcontainers:base-lint
COPY --from=misspell /usr/local/bin/misspell /usr/local/bin/
COPY --from=woke /usr/local/bin/woke /usr/local/bin/
COPY --from=lychee /usr/local/bin/lychee /usr/local/bin/

# Timestamp: 1640920142
