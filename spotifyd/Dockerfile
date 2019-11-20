# docker run -d --device /dev/snd -v ~/.config/spotifyd/password:/root/.config/spotifyd/password --name spotifyd jchorl/spotifyd
FROM ubuntu:19.10
RUN apt-get update && \
    apt install -y wget && \
    wget https://github.com/Spotifyd/spotifyd/releases/download/v0.2.19/spotifyd-linux-slim.tar.gz && \
    tar -xf spotifyd-linux-slim.tar.gz

FROM ubuntu:19.10
RUN apt-get update && \
    apt-get install -y alsa
COPY --from=0 /spotifyd /bin/spotifyd
COPY spotifyd.conf /root/.config/spotifyd/spotifyd.conf
CMD /bin/spotifyd --no-daemon
