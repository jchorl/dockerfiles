# docker run -it --rm --privileged gpg2

FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    gnupg2 \
    scdaemon \
    pcscd

CMD sh -c "pcscd && bash"
