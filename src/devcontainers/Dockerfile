FROM nomiro/alpenglow-packages:csvkit as csvkit
FROM nomiro/alpenglow-packages:lychee as lychee
FROM nomiro/alpenglow-packages:misspell as misspell
FROM nomiro/alpenglow-packages:poetry as poetry
FROM nomiro/alpenglow-packages:proselint as proselint
FROM nomiro/alpenglow-packages:prospector as prospector
FROM nomiro/alpenglow-packages:reorder_python_imports as reorder_python_imports
FROM nomiro/alpenglow-packages:woke as woke
FROM nomiro/alpenglow-packages:wtf as wtf
FROM nomiro/alpenglow-packages:yamllint as yamllint

ARG TAG
COPY tags/${TAG}.sh /tmp/${TAG}.sh
RUN mkdir /tmp/dist && \
  /tmp/${TAG}.sh

FROM nomiro/alpenglow-base:devcontainer
COPY --from=csvkit /usr/local/bin /usr/local/bin
COPY --from=lychee /usr/local/bin /usr/local/bin
COPY --from=misspell /usr/local/bin /usr/local/bin
COPY --from=poetry /usr/local/bin /usr/local/bin
COPY --from=proselint /usr/local/bin /usr/local/bin
COPY --from=prospector /usr/local/bin /usr/local/bin
COPY --from=reorder_python_imports /usr/local/bin /usr/local/bin
COPY --from=woke /usr/local/bin /usr/local/bin
COPY --from=wtf /usr/local/bin /usr/local/bin
COPY --from=yamllint /usr/local/bin /usr/local/bin

# Timestamp: 1640929993
