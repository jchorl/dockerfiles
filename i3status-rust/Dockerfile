# we use ubuntu and install the toolchain because
# as of 7/27, debian doesn't support libssl3
FROM ubuntu:22.04

# deps from https://spotifyd.github.io/spotifyd/installation/Ubuntu.html
RUN apt-get update && apt install --no-install-recommends -y -qq \
    libssl-dev wget curl ca-certificates build-essential pkg-config libpulse-dev libsensors-dev && \
    rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="${PATH}:/root/.cargo/bin"

ARG GIT_SHA=8f0264b4bf093f89ec7928919d8d0c7cff6a92e0

WORKDIR /i3status-rust
RUN wget -q -O - https://github.com/greshake/i3status-rust/archive/${GIT_SHA}.tar.gz \
    | tar xzv --strip=1

RUN cargo build --release
