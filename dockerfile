FROM ubuntu
WORKDIR /root
ENV DEBIAN_FRONTEND  noninteractive
ENV OPENWRT_SDK openwrt-sdk-19.07.4-mvebu-cortexa9_gcc-7.5.0_musl_eabi.Linux-x86_64
COPY ${OPENWRT_SDK}.tar.xz /root/${OPENWRT_SDK}.tar.xz
RUN apt-get update && \
    apt-get install xz-utils vim -y && \
    tar -xvf /root/${OPENWRT_SDK}.tar.xz  && \
    mv /root/${OPENWRT_SDK} /root/sdk && cd /root/sdk &&\
    apt-get install build-essential ccache flex gawk gettext git liblzma-dev libncurses5-dev libssl-dev python subversion u-boot-tools unzip wget xsltproc zlib1g-dev python3 -y && \
    ./scripts/feeds update -a && \
    ./scripts/feeds install -a
