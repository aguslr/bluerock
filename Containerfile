ARG FEDORA_MAJOR_VERSION=38

FROM ghcr.io/aguslr/bluefusion:${FEDORA_MAJOR_VERSION}

COPY rootfs/ /

RUN systemctl enable rpm-ostree-kargs.service
