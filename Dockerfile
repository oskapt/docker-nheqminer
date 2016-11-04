FROM ubuntu:16.04

MAINTAINER Adrian Goins <mon@chus.cc>

RUN apt-get update && apt-get -qq install cmake build-essential libboost-all-dev git wget

RUN cd /opt && git clone -b Linux https://github.com/nicehash/nheqminer.git
RUN cd /opt/nheqminer/cpu_xenoncat/Linux/asm && \
    sh assemble.sh && cd ../../../Linux_cmake/nheqminer_cpu && cmake . && \
    make -j $(nproc) && cp nheqminer_cpu /usr/local/bin

# Install [dumb-init](https://github.com/Yelp/dumb-init)
ENV DI_VERSION 1.2.0
RUN cd /tmp && \
    wget -q -O /bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v${DI_VERSION}/dumb-init_${DI_VERSION}_amd64 && \
    chmod +x /bin/dumb-init

COPY start.sh /start.sh
RUN chmod 755 /start.sh

WORKDIR /opt/nheqminer

ARG VCS_REF
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/oskapt/docker-nheqminer"

CMD ["/bin/dumb-init", "/start.sh"]
