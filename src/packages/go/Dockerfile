FROM nomiro/alpenglow-sdk:go as build

ARG TAG
COPY tags/${TAG}.sh /tmp/${TAG}.sh
RUN mkdir /tmp/dist && \
  /tmp/${TAG}.sh

FROM alpine:3.15
COPY --from=build /tmp/dist /usr/local/bin
RUN ls -lh /usr/local/bin
