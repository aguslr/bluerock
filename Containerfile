ARG FEDORA_MAJOR_VERSION=40

FROM ghcr.io/aguslr/bluefusion:${FEDORA_MAJOR_VERSION}

COPY rootfs/ /

RUN systemctl enable flatpak-update.timer && \
    systemctl enable rpm-ostree-kargs.service && \
    rpm-ostree override remove firefox firefox-langpacks --install chromium && \
    rpm-ostree install haveged && \
    systemctl enable haveged.service && \
    rpm-ostree cleanup -m && \
    ostree container commit
