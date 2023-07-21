ARG FEDORA_MAJOR_VERSION=38

FROM ghcr.io/aguslr/bluefusion:${FEDORA_MAJOR_VERSION}

COPY rootfs/ /

RUN systemctl enable rpm-ostree-kargs.service && \
    rpm-ostree install chromium haveged && \
    rpm-ostree override remove firefox firefox-langpacks && \
    rpm-ostree cleanup -m && \
    ostree container commit
