FROM ubuntu:18.04

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install wget git pwgen && \
        apt-get -y install software-properties-common libzmq3-dev && \
        apt-get -y install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libboost-all-dev unzip libminiupnpc-dev python-virtualenv && \
        apt-get -y install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils && \
        add-apt-repository ppa:bitcoin/bitcoin && \
        apt-get update && \
        apt-get -y install libdb4.8-dev libdb4.8++-dev &&\
        apt-get -y install sudo

RUN echo "monoeci ALL=(ALL) NOPASSWD : ALL" >> /etc/sudoers

ARG MONOECICORE_VERSION="0.12.2.3"
ARG MONOECICORE_FILENAME="monoeciCore-${MONOECICORE_VERSION}-linux64.tar.gz"
ARG MONOECICORE_URL="https://github.com/monacocoin-net/monoeci-core/releases/download/v${MONOECICORE_VERSION}/${MONOECICORE_FILENAME}"
WORKDIR /root
RUN wget ${MONOECICORE_URL} && \
        tar xvf ${MONOECICORE_FILENAME} -C /monoeciCore 