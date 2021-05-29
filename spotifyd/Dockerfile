# docker run -d \
#     -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
#     -v /run/user/1000/pulse:/run/user/1000/pulse \
#     -v /home/j/.config/spotifyd/password:/home/spotifyd/.config/spotifyd/password:ro \
#     --restart=always \
#     -e DISPLAY=$DISPLAY \
#     jchorl/spotifyd:51bd2f4f554059c92ac51289f1de112b6daf5a22 \
#     --device-name bike

FROM rust:1.52

# deps from https://github.com/Spotifyd/spotifyd/tree/99f058a7010e5da5425b7c572efb9f1ed8f866e8#compiling-from-source
RUN apt-get update && apt install -y \
    libasound2-dev libssl-dev libpulse-dev libdbus-1-dev \
    git
RUN git clone https://github.com/Spotifyd/spotifyd.git
WORKDIR /spotifyd

# latest as of April 3, 2021
RUN git checkout 82bc875efc4e1b2e0e1c2e489e3dd4f2e6a5b97b

RUN cargo build --release --no-default-features --features pulseaudio_backend,dbus_keyring,dbus_mpris

FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    alsa \
    pulseaudio \
    dbus-x11

RUN useradd -ms /bin/bash -d /home/spotifyd --uid 1000 spotifyd
USER spotifyd
WORKDIR /home/spotifyd

COPY --from=0 /spotifyd/target/release/spotifyd /bin/spotifyd
COPY spotifyd.conf /home/spotifyd/.config/spotifyd/spotifyd.conf
COPY spotifyd.sh .
COPY pulse-client.conf /etc/pulse/client.conf
ENTRYPOINT ["/home/spotifyd/spotifyd.sh", "--no-daemon", "--config-path", "/home/spotifyd/.config/spotifyd/spotifyd.conf"]
