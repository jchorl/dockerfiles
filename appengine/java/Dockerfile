FROM java:8

RUN apt-get update && apt-get install -y gradle
RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-239.0.0-linux-x86_64.tar.gz && \
    tar -xf google-cloud-sdk-239.0.0-linux-x86_64.tar.gz && \
    ./google-cloud-sdk/install.sh
ENV PATH="/google-cloud-sdk/bin/:${PATH}"
RUN gcloud components install app-engine-java
