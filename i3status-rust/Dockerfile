FROM ubuntu:24.04

RUN apt-get update && apt install --no-install-recommends -y -qq \
    wget \
    curl \
    ca-certificates \
    build-essential \
    pkg-config \
    libssl-dev \
    libpipewire-0.3-dev \
    libsensors-dev \
    libpulse-dev \
    clang \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="${PATH}:/root/.cargo/bin"

ARG GIT_SHA=0b2da9ca7a9e7df181e717dd67b39ceb2aa7f4db

WORKDIR /i3status-rust
RUN wget -q -O - https://github.com/greshake/i3status-rust/archive/${GIT_SHA}.tar.gz \
    | tar xzv --strip=1

RUN cargo build --release --features pipewire
