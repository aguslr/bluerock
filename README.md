[BlueRock][1]
=============

[![build-image](https://github.com/aguslr/bluerock/actions/workflows/build.yml/badge.svg)](https://github.com/aguslr/bluerock/actions/workflows/build.yml)

A Fedora Silverblue image that has been hardened for extra security.

Usage
-----

1. Rebase to an unsigned image to get proper signing keys:

       rpm-ostree rebase -r ostree-unverified-registry:ghcr.io/aguslr/bluerock:stable

2. Rebase to a signed image to finish the installation:

       rpm-ostree rebase -r ostree-image-signed:docker://ghcr.io/aguslr/bluerock:stable

Alternatively, an [ISO file for offline installation][5] can be generated with
the following command:

    sudo podman run --rm --privileged \
        --volume .:/build-container-installer/build \
        --security-opt label=disable --pull=newer \
        ghcr.io/jasonn3/build-container-installer:latest \
        IMAGE_REPO="ghcr.io/aguslr" \
        IMAGE_NAME="bluerock" \
        IMAGE_TAG="latest" \
        VARIANT="Silverblue"

Features
--------

From [BlueVanilla][8]:

- Start with a base Fedora Silverblue image.
- Add the `gnome-tweaks` package.
- Restore GNOME's default background.
- Replace Fedora repository with unfiltered Flathub repository.
- Replace Fedora's Flatpaks with the ones from Flathub.
- Remove unused Flatpak dependencies automatically.
- Set automatic checking of updates for the system.
- Reduce *systemd* shutdown timers.

From [BlueFusion][9]:

- Install [Homebrew][10] on `x86_64`.
- Install [Nix][11].
- Replace [Toolbox][12] with [Distrobox][3].
- Add RPM Fusion repositories and several multimedia packages.
- Add keyboard shortcuts:
  + Open Terminal into the system's shell: `<Control><Alt>t`
  + Open Terminal into the default Distrobox container: `<Super>Return`

Additional features:

- Set automatic updates for the system.
- Set automatic updates for Flatpaks.
- Set automatic updates for [Homebrew][6].
- Set automatic updates for [Nix][7].
- Set additional kernel boot parameters.
- Set additional kernel runtime parameters.
- Blacklist rarely used kernel modules.
- Install Chromium.
- Allow only verified Flathub apps.

To disable **Homebrew** and **Nix**, mask the mounts by running:

    sudo systemctl mask nix.mount
    sudo systemctl mask var-home-linuxbrew.mount

Verification
------------

These images are signed with Sisgstore's [Cosign][4]. You can verify the
signature by downloading the `cosign.pub` key from this repo and running the
following command:

    cosign verify --key cosign.pub ghcr.io/aguslr/bluerock

References
----------

- [Linux Hardening Guide | Madaidan's Insecurities][2]
- [Security - ArchWiki][3]


[1]:  https://github.com/aguslr/bluerock
[2]:  https://madaidans-insecurities.github.io/guides/linux-hardening.html
[3]:  https://wiki.archlinux.org/title/Security
[4]:  https://docs.sigstore.dev/cosign/overview/
[5]:  https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso
[6]:  https://brew.sh/
[7]:  https://nixos.org/
[8]:  https://github.com/aguslr/bluevanilla
[9]:  https://github.com/aguslr/bluefusion
[10]: https://brew.sh/
[11]: https://nixos.org/download/
[12]: https://github.com/containers/toolbox
