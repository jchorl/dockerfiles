# docker run -ti \
#     -l pass \
#     --name pass \
#     jchorl/pass

FROM debian
LABEL maintainer "Josh Chorlton <josh@joshchorlton.com>"

RUN apt-get update && \
    apt-get install -y pass

CMD bash
