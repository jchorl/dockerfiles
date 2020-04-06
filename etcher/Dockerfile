FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y \
    wget
WORKDIR /etcher
RUN wget https://github.com/balena-io/etcher/releases/download/v1.4.9/balena-etcher-cli-1.4.9-linux-x64.tar.gz && \
    tar -xf balena-etcher-cli-1.4.9-linux-x64.tar.gz

FROM ubuntu:18.04
WORKDIR /etcher
COPY --from=0 /etcher/balena-etcher-cli-1.4.9-linux-x64-dist .
ENTRYPOINT /etcher/balena-etcher
