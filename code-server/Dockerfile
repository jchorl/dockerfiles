# docker run -it --rm -p 8080:8080 jchorl/code-server

FROM ubuntu:22.04

RUN apt-get -qq update && \
    apt-get -qq install -y curl && \
    curl -fsSL https://code-server.dev/install.sh | sh && \
    rm -rf /var/lib/apt/lists/*

CMD ["code-server", "--auth", "none", "--bind-addr", "0.0.0.0:8080"]
