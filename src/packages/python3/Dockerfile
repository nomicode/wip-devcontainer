FROM nomiro/alpenglow-sdk:python3 as build

ARG TAG
WORKDIR /tmp
COPY tags/${TAG}.sh /tmp/${TAG}.sh
RUN mkdir /tmp/dist && \
  /tmp/${TAG}.sh

FROM alpine:3.14
COPY --from=build /tmp/dist /usr/local/bin
RUN ls -l /usr/local/bin
