# Transient interface for qBittorrent

[![build-then-test](https://github.com/theobori/qbittorrent-transient/actions/workflows/build-then-test.yml/badge.svg)](https://github.com/theobori/qbittorrent-transient/actions/workflows/build-then-test.yml)

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

qbittorrent-transient is a KISS Emacs package which contains a [Transient](https://docs.magit.vc/transient/) interface for qBittorrent.

## Getting started

To use the project you need [Emacs](https://www.gnu.org/software/emacs/) with a version higher or equal than `30.1`, [Transient](https://docs.magit.vc/transient/), [qBittorrent](https://www.qbittorrent.org) and [GNU Make](https://www.gnu.org/software/make/) if you want to build and install it manually.

## Installation

To install it manually, download the code from this [GitHub repository](https://github.com/theobori/qbittorrent-transient) and then load it. To do this, you can use the following command lines.

```bash
make install
```

Then you can evaluate the following ELisp expression.

```emacs-lisp
(add-to-list 'load-path (file-name-concat user-emacs-directory "manual-packages" "qbittorrent-transient"))
```

## Contribute

If you want to help the project, you can follow the guidelines in [CONTRIBUTING.md](./CONTRIBUTING.md).
