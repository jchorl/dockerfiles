# auth requires this workaround: https://github.com/Rigellute/spotify-tui/issues/136#issuecomment-549771256
# docker run -it --rm --net=host -v spotify-tui-creds:/root/.config/spotify-tui/ jchorl/spotify-tui:b4cde9c5deb2d3a0251c2bc6f50e96a3b000eac9

FROM rust:1.62-bullseye

RUN apt-get update && apt-get install --no-install-recommends -y -qq \
    wget \
    libxcb-shape0-dev \
    libxcb-xfixes0-dev && \
    rm -rf /var/lib/apt/lists/*

ARG SPOTIFY_TUI_SHA=c4dcf6b9fd8318017acbdd7ec005955e26cf2794

WORKDIR /spotify-tui
RUN wget -q -O - https://github.com/Rigellute/spotify-tui/archive/${SPOTIFY_TUI_SHA}.tar.gz \
    | tar xzv --strip=1

RUN cargo build --release

FROM debian:bullseye
RUN apt-get update && apt-get install --no-install-recommends -y -qq \
    libxcb1 \
    libxcb-render0 \
    libxcb-shape0 \
    libxcb-xfixes0 \
    libssl1.1 \
    ca-certificates

COPY --from=0 /spotify-tui/target/release/spt /usr/bin/spt

# we don't use /root/.config so we can mount a named volume over that to store creds
COPY ./config.yml /config.yml
ENTRYPOINT ["/usr/bin/spt", "--config", "/config.yml"]
