# docker run -d \
#     -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
#     -v /run/user/1000/pulse:/run/user/1000/pulse \
#     -v /home/j/.config/spotifyd/password:/home/spotifyd/.config/spotifyd/password:ro \
#     --restart=always \
#     -e DISPLAY=$DISPLAY \
#     jchorl/spotifyd:51bd2f4f554059c92ac51289f1de112b6daf5a22 \
#     --device-name bike

FROM rust:1.62

# deps from https://spotifyd.github.io/spotifyd/installation/Ubuntu.html
RUN apt-get update && apt install --no-install-recommends -y -qq \
    libasound2-dev libssl-dev pkg-config libpulse-dev libdbus-1-dev \
    wget && \
    rm -rf /var/lib/apt/lists/*

ARG SPOTIFYD_SHA=993336f74ec89cb6cad23dd009251e70548761b6

WORKDIR /spotifyd
RUN wget -q -O - https://github.com/Spotifyd/spotifyd/archive/${SPOTIFYD_SHA}.tar.gz \
    | tar xzv --strip=1

RUN cargo build --release --no-default-features --features pulseaudio_backend,dbus_keyring,dbus_mpris

FROM ubuntu:22.04
RUN apt-get update && apt install --no-install-recommends -y -qq \
    alsa \
    pulseaudio \
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
