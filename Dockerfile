FROM debian:trixie

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update && \
    apt-get install -y \
    wget git bc sshfs bison flex libssl-dev python3 make kmod libc6-dev libncurses5-dev \
    crossbuild-essential-armhf \
    crossbuild-essential-arm64

RUN mkdir -p /root/.ssh
RUN chmod 644 /root/.ssh

COPY copykernel.sh /usr/local/bin/copykernel
RUN chmod +x /usr/local/bin/copykernel

RUN mkdir -p /build/{modules,linux}
WORKDIR /build

CMD ["bash"]
