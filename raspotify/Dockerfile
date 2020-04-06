FROM ubuntu:19.10

# Install curl and https apt transport
RUN apt-get update
RUN apt-get -y install \
    curl \
    apt-transport-https \
    gnupg2

# Add repo and its GPG key
RUN curl -sSL https://dtcooper.github.io/raspotify/key.asc | apt-key add -v -
RUN echo 'deb https://dtcooper.github.io/raspotify raspotify main' | tee /etc/apt/sources.list.d/raspotify.list

# Install package
RUN apt-get update
RUN apt-get -y install raspotify

RUN mkdir -m 0755 -p /var/cache/raspotify
RUN chown raspotify:raspotify /var/cache/raspotify

USER raspotify

ENV DEVICE_NAME Bedroom
ENV BITRATE 160
ENV CACHE_ARGS --disable-audio-cache
ENV VOLUME_ARGS --enable-volume-normalisation --linear-volume --initial-volume=100
ENV BACKEND_ARGS --backend alsa

CMD /usr/bin/librespot --name ${DEVICE_NAME} $BACKEND_ARGS --bitrate ${BITRATE} $CACHE_ARGS $VOLUME_ARGS $OPTIONS
