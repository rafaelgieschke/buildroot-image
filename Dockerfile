FROM gcc

RUN apt-get update && apt-get upgrade -y && apt-get -y install \
  cpio \
  unzip \
  rsync \
  bc

WORKDIR /root
COPY buildroot buildroot
COPY external-packages external-packages

WORKDIR /root/buildroot
COPY .config .
RUN make BR2_EXTERNAL="/root/external-packages" BR2_JLEVEL="$(nproc)"
RUN cp output/images/rootfs.iso9660 /image.iso
CMD cat /image.iso
