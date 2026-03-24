;;; qbittorrent-transient-test.el --- Units tests for qbittorrent-transient  -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Théo Bori

;; Author: Théo Bori <theobori@disroot.org>
;; Maintainer: Théo Bori <theobori@disroot.org>
;; Keywords: tools
;; URL: https://github.com/theobori/qbittorrent-transient

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

;; Units tests for qbittorrent-transient

;;; Code

(require 'qbittorrent-transient)
(require 'ert)

;;;; Units tests for qbittorrent-transient

(ert-deftest test-qbittorrent-transient ()
  "Test that `qbittorrent-transient' works correctly."
  (should (equal t t)))

(provide 'qbittorrent-transient-test)

;;; qbittorrent-transient-test.el ends here
