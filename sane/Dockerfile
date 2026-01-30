# scanimage \
#   --source "ADF" \
#   --progress \
#   --scan-intent Document \
#   --mode Gray \
#   --resolution 300 \
#   --batch=page-%03d.tif \
#   --format=tiff
# tiffcrop -U in -E top -X 8.5 -Y 11 combined.tif cropped.tif
# tiff2pdf -j -q 85 -o out.pdf -p letter cropped.tif

FROM ubuntu:25.10

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update && apt-get -qq install -y --no-install-recommends \
    sane-utils \
    sane-airscan \
    ca-certificates \
    curl \
    libtiff-tools \
 && rm -rf /var/lib/apt/lists/*

ADD airscan.conf /etc/sane.d/
