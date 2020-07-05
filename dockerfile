FROM ubuntu
WORKDIR /root
ENV DEBIAN_FRONTEND  noninteractive
COPY openwrt-sdk-mvebu-cortexa9_gcc-8.4.0_musl_eabi.Linux-x86_64.tar.xz /root/openwrt-sdk-mvebu-cortexa9_gcc-8.4.0_musl_eabi.Linux-x86_64.tar.xz
RUN apt-get update && \
    apt-get install xz-utils -y && \
    tar -xvf /root/openwrt-sdk-mvebu-cortexa9_gcc-8.4.0_musl_eabi.Linux-x86_64.tar.xz && \
    cd openwrt-sdk-mvebu-cortexa9_gcc-8.4.0_musl_eabi.Linux-x86_64 && \
    apt-get install build-essential ccache flex gawk gettext git liblzma-dev libncurses5-dev libssl-dev python subversion u-boot-tools unzip wget xsltproc zlib1g-dev python3 -y && \
    ./scripts/feeds update -a && \
    ./scripts/feeds install -a
