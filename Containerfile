ARG FEDORA_MAJOR_VERSION=38

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

COPY rootfs/ /

RUN systemctl enable rpm-ostree-kargs.service && \
    systemctl enable proc-hidepid.service && \
    rpm-ostree install chromium haveged && \
    rpm-ostree override remove firefox firefox-langpacks && \
    rpm-ostree cleanup -m && \
    ostree container commit
