;;; qbittorrent-transient.el --- A transient interface for qBittorrent  -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Théo Bori

;; Author: Théo Bori <theobori@disroot.org>
;; Maintainer: Théo Bori <theobori@disroot.org>
;; Keywords: tools
;; URL: https://github.com/theobori/qbittorrent-transient
;; Version: 1.0.0
;; Package-Requires: ((emacs "30.1") (transient "0.12"))

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary

;; qbittorrent-transient is an Emacs package providing a Transient interface for the qBittorrent CLI.

;;; Code

(require 'transient)

(defgroup qbittorrent-transient ()
  "Emacs package dependency visualizer"
  :group 'tools
  :link '(url-link :tag "GitHub Repository" "https://github.com/theobori/qbittorrent-transient"))

;;;; User options

(defcustom qbittorrent-transient-qbittorrent-path (executable-find "qbittorrent")
  "qBittorrent executable path"
  :type 'string
  :group 'qbittorrent-transient)

;;;; Functions and Emacs user commands

;; définir toutes les options
;; définir un préfix transient avec les options
;; Read a torrent
;;   From file
;;   From URL

(provide 'qbittorrent-transient)

;;; qbittorrent-transient.el ends here
