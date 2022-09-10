# docker run -d \
#     --name spotifyd \
#     -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
#     -v /run/user/1000/pulse:/run/user/1000/pulse \
#     -v /home/j/.config/spotifyd/password:/home/spotifyd/.config/spotifyd/password:ro \
#     --restart=no \
#     -e DISPLAY=$DISPLAY \
#     jchorl/spotifyd:be50e0bc3ef393eda91a1fff577487e5c534eff8 \
#     --device-name bike

# we use ubuntu and install the toolchain because
# as of 7/27, debian doesn't support libssl3
FROM ubuntu:22.04

# deps from https://spotifyd.github.io/spotifyd/installation/Ubuntu.html
RUN apt-get update && apt install --no-install-recommends -y -qq \
    libasound2-dev libssl-dev pkg-config libpulse-dev libdbus-1-dev \
    build-essential \
    curl wget ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="${PATH}:/root/.cargo/bin"

ARG SPOTIFYD_SHA=7146f64a819590a16de9991de74f8bc2fea9c2ac

WORKDIR /spotifyd
RUN wget -q -O - https://github.com/Spotifyd/spotifyd/archive/${SPOTIFYD_SHA}.tar.gz \
    | tar xzv --strip=1

RUN cargo build --release --no-default-features --features pulseaudio_backend,dbus_keyring,dbus_mpris

FROM ubuntu:22.04
RUN apt-get update && apt install --no-install-recommends -y -qq \
    alsa \
    pulseaudio \
    ca-certificates \
    dbus-x11 && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash -d /home/spotifyd --uid 1000 spotifyd
USER spotifyd
WORKDIR /home/spotifyd

COPY --from=0 /spotifyd/target/release/spotifyd /bin/spotifyd
COPY spotifyd.conf /home/spotifyd/.config/spotifyd/spotifyd.conf
COPY spotifyd.sh .
COPY pulse-client.conf /etc/pulse/client.conf
ENTRYPOINT ["/home/spotifyd/spotifyd.sh", "--no-daemon", "--config-path", "/home/spotifyd/.config/spotifyd/spotifyd.conf"]
