[BlueRock][1]
=============

[![build-image](https://github.com/aguslr/bluerock/actions/workflows/build.yml/badge.svg)](https://github.com/aguslr/bluerock/actions/workflows/build.yml)

A Fedora Silverblue image that has been hardened for extra security.

Usage
-----

    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/aguslr/bluerock:latest

Features
--------

- Start with a base Fedora Silverblue image.
- Set additional kernel boot parameters.
- Set additional kernel runtime parameters.
- Blacklist rarely used kernel modules.
- Replace Firefox with Chromium.
- Allow only verified Flathub apps.

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


[1]: https://github.com/aguslr/bluerock
[2]: https://madaidans-insecurities.github.io/guides/linux-hardening.html
[3]: https://wiki.archlinux.org/title/Security
[4]: https://docs.sigstore.dev/cosign/overview/
