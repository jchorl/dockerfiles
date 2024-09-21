# docker run -it --rm \
#     --privileged \
#     --net=host \
#     -v $(pwd):/work \
#     jchorl/ventoy \
#     ./VentoyWeb.sh

FROM ubuntu:24.04

RUN apt-get -qq update && apt-get -qq install -y \
    wget \
    xz-utils

WORKDIR /ventoy

ARG VENTOY_VERSION=1.0.99

RUN wget -q -O- "https://downloads.sourceforge.net/project/ventoy/v${VENTOY_VERSION}/ventoy-${VENTOY_VERSION}-linux.tar.gz" \
    | tar -xz --strip-components=2 -f -
