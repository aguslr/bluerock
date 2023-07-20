ARG FEDORA_MAJOR_VERSION=38

FROM ghcr.io/aguslr/bluefusion:${FEDORA_MAJOR_VERSION}

COPY rootfs/ /
