ARG FEDORA_MAJOR_VERSION=40

FROM ghcr.io/aguslr/bluefusion:${FEDORA_MAJOR_VERSION}

COPY rootfs/ /

RUN <<-EOT sh
	set -eu

	systemctl enable flatpak-update.timer
	systemctl enable homebrew-upgrade.timer
	systemctl enable nix-upgrade.timer
	systemctl enable rpm-ostree-kargs.service

	rpm-ostree install chromium
	rpm-ostree install haveged && systemctl enable haveged.service

	rpm-ostree cleanup -m && ostree container commit
EOT
