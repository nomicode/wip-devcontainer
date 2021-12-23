FROM mcr.microsoft.com/vscode/devcontainers/base:alpine-3.14

ARG TAG
COPY tags/${TAG}.sh /tmp/${TAG}.sh
RUN /tmp/${TAG}.sh
