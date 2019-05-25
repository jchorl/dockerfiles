FROM ubuntu:18.04

WORKDIR /root
RUN apt-get update && apt-get install -y \
    curl && \
    curl https://getcaddy.com | bash -s personal

CMD caddy
