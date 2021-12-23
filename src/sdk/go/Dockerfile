FROM nomiro/alpenglow-base:sdk

ENV GOPATH=/usr/local/go
ENV GOBIN=/usr/local/bin

ARG TAG
COPY tags/${TAG}.sh /tmp/${TAG}.sh
RUN /tmp/${TAG}.sh
