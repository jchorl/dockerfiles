# auth requires this workaround: https://github.com/Rigellute/spotify-tui/issues/136#issuecomment-549771256
# docker run -it --rm -v spotify-tui-creds:/root/.config/spotify-tui/ jchorl/spotify-tui

ARG RUST_VERSION=1.43.1

FROM rust:${RUST_VERSION}

ARG REPO=https://github.com/Rigellute/spotify-tui.git
ARG COMMIT=7a5a04c91a2aac49ee77a1b622a33b680d852ceb

RUN apt-get update && apt-get install -y \
    libxcb-shape0-dev \
    libxcb-xfixes0-dev

RUN git clone ${REPO} /build
WORKDIR /build
RUN git checkout ${COMMIT}
RUN cargo build --release

FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    libxcb1 \
    libxcb-render0 \
    libxcb-shape0 \
    libxcb-xfixes0 \
    libssl1.1 \
    ca-certificates
COPY --from=0 /build/target/release/spt /spotify-tui

# we don't use /root/.config so we can mount a named volume over that to store creds
COPY ./config.yml /config.yml
ENTRYPOINT ["/spotify-tui", "--config", "/config.yml"]
