FROM gcc

RUN apt-get update && apt-get upgrade -y && apt-get -y install \
  cpio \
  unzip \
  rsync \
  bc

WORKDIR /root
COPY buildroot .
COPY external-packages .

WORKDIR /root/buildroot
COPY .config .
RUN make -j $(nproc)
RUN cp output/images/rootfs.iso9660 /image.iso
CMD cat /image.iso
