FROM rust:1.82

RUN apt-get update
RUN apt-get -y install build-essential portaudio19-dev curl unzip
RUN apt-get clean && rm -fR /var/lib/apt/lists

#ARG ARCH=amd64
ENV ARCH=amd64
#ARG LIBRESPOT_VERSION=0.1.3
ENV LIBRESPOT_VERSION=0.5.0

RUN mkdir /workdir
COPY ./install-librespot.sh /workdir/
#RUN /tmp/install-librespot.sh
RUN /workdir/install-librespot.sh
#RUN mkdir -p /usr/local/cargo/bin/ && touch /usr/local/cargo/bin/librespot
#RUN cargo install librespot --version "${LIBRESPOT_VERSION}"
