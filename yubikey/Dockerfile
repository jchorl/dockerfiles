FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    gnupg2 gnupg-agent pinentry-curses scdaemon pcscd yubikey-personalization libusb-1.0-0-dev \
    curl dirmngr gcc make pkg-config hopenpgp-tools

RUN curl -sO https://developers.yubico.com/yubikey-personalization/Releases/ykpers-1.17.3.tar.gz && \
    curl -sO https://developers.yubico.com/yubikey-personalization/Releases/ykpers-1.17.3.tar.gz.sig && \
    gpg ykpers*sig; \
    gpg --recv 0xBCA00FD4B2168C0A && \
    gpg ykpers*sig && \
    curl -sO https://developers.yubico.com/yubico-c/Releases/libyubikey-1.13.tar.gz && \
    curl -sO https://developers.yubico.com/yubico-c/Releases/libyubikey-1.13.tar.gz.sig && \
    gpg libyubi*sig && \
    tar xf libyubikey-1.13.tar.gz && \
    cd libyubikey-1.13 && \
    ./configure && make && make install && \
    cd .. && \
    tar xf ykpers-1.17.3.tar.gz && \
    cd ykpers-1.17.3 && \
    ./configure && make && make install && \
    ldconfig
