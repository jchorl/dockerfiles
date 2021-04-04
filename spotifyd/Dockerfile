# docker run -d \
#     --device /dev/snd \
#     -v /home/j/.spotify_password:/root/.config/spotifyd/password:ro \
#     --restart=always \
#     --env ALSA_CARD=Generic \
#     jchorl/spotifyd:26adfa67ea2ad405ae6d7b5930742a2b81bd8d6b \
#     --device-name bike
# on some machines, also --env ALSA_CARD=Generic (found using aplay -l https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture#Select_the_default_PCM_via_environment_variable)
FROM rust:1.51

# deps from https://github.com/Spotifyd/spotifyd/tree/99f058a7010e5da5425b7c572efb9f1ed8f866e8#compiling-from-source
RUN apt-get update && apt install -y \
    libasound2-dev libssl-dev libpulse-dev libdbus-1-dev \
    git
RUN git clone https://github.com/Spotifyd/spotifyd.git
WORKDIR /spotifyd

# latest as of April 3, 2021
RUN git checkout 82bc875efc4e1b2e0e1c2e489e3dd4f2e6a5b97b

RUN cargo build --release

FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    alsa
COPY --from=0 /spotifyd/target/release/spotifyd /bin/spotifyd
COPY spotifyd.conf /root/.config/spotifyd/spotifyd.conf
ENTRYPOINT ["/bin/spotifyd", "--no-daemon", "--config-path", "/root/.config/spotifyd/spotifyd.conf"]
