ARG FEDORA_MAJOR_VERSION=39

FROM ghcr.io/aguslr/bluefusion:${FEDORA_MAJOR_VERSION}

COPY rootfs/ /

RUN systemctl enable rpm-ostree-kargs.service && \
    systemctl enable flatpak-replace-flathub-repo.service && \
    systemctl enable flatpak-update.timer && \
    sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
    rpm-ostree install chromium haveged && \
    rpm-ostree override remove firefox firefox-langpacks && \
    rpm-ostree cleanup -m && \
    ostree container commit
