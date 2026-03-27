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
  "Transient interface for qBittorrent"
  :group 'tools
  :link '(url-link :tag "GitHub Repository" "https://github.com/theobori/qbittorrent-transient"))

;;;; User options

(defcustom qbittorrent-transient-qbittorrent-path (executable-find "qbittorrent")
  "qBittorrent executable path"
  :type 'string
  :group 'qbittorrent-transient)

(defcustom qbittorrent-transient-extra-arguments nil
  "qBittorrent executable extra arguments"
  :type '(repeat string)
  :group 'qbittorrent-transient)

;;;; Functions and Emacs user commands

;; qBittorrent options

(transient-define-argument qbittorrent-transient--argument-confirm-legal-notice ()
  :description "Confirm the legal notice"
  :key "-l"
  :argument "--confirm-legal-notice")

(transient-define-argument qbittorrent-transient--argument-webui-port ()
  :description "Change the WebUI port"
  :class 'transient-option
  :key "-w"
  :argument "--webui-port="
  :reader #'transient-read-number-N+)

(transient-define-argument qbittorrent-transient--argument-torrenting-port ()
  :description "Change the torrenting port"
  :class 'transient-option
  :key "-tp"
  :argument "--torrenting-port="
  :reader #'transient-read-number-N+)

(transient-define-argument qbittorrent-transient--argument-no-splash ()
  :description "Disable splash screen"
  :key "-ns"
  :argument "--no-splash")

(transient-define-argument qbittorrent-transient--argument-profile ()
  :description "Store configuration files in <dir>"
  :class 'transient-option
  :key "-p"
  :argument "--profile="
  :reader #'transient-read-directory)

(transient-define-argument qbittorrent-transient--argument-configuration ()
  :description "Store configuration files in directories qBittorrent_<name>"
  :class 'transient-option
  :key "-co"
  :argument "--configuration=")

(transient-define-argument qbittorrent-transient--argument-relative-fastresume ()
  :description "Hack into libtorrent fastresume files and make file paths relative to the profile directory"
  :key "-rf"
  :argument "--relative-fastresume")

;; qBittorrent options when adding new torrents

(transient-define-argument qbittorrent-transient--argument-save-path ()
  :description "Torrent save path"
  :class 'transient-option
  :key "-sa"
  :argument "--save-path="
  :reader #'transient-read-directory)

(transient-define-argument qbittorrent-transient--argument-add-stopped ()
  :description "Add torrents as running or stopped"
  :class 'transient-option
  :key "-a"
  :argument "--add-stopped="
  :reader #'qbittorrent-transient--read-true-or-false)

(transient-define-argument qbittorrent-transient--argument-skip-hash-check ()
  :description "Skip hash check"
  :key "-hc"
  :argument "--skip-hash-check")

(transient-define-argument qbittorrent-transient--argument-category ()
  :description "Assign torrents to category. If the category doesn't exist, it will be created"
  :class 'transient-option
  :key "-ca"
  :argument "--category=")

(transient-define-argument qbittorrent-transient--argument-sequential ()
  :description "Download files in sequential order"
  :key "-se"
  :argument "--sequential")

(transient-define-argument qbittorrent-transient--argument-first-and-last ()
  :description "Download first and last pieces first"
  :key "-f"
  :argument "--first-and-last")

(transient-define-argument qbittorrent-transient--argument-skip-dialog ()
  :description "Specify whether the \"Add New Torrent\" dialog opens when adding a torrent."
  :class 'transient-option
  :key "-sd"
  :argument "--skip-dialog="
  :reader #'qbittorrent-transient--read-true-or-false)

;;;###autoload (autoload 'qbittorrent-transient "qbittorrent-transient" nil t)
(transient-define-prefix qbittorrent-transient ()
  "Run `qbittorrent'."
  ["qBittorrent options"
   (qbittorrent-transient--argument-confirm-legal-notice)
   (qbittorrent-transient--argument-webui-port)
   (qbittorrent-transient--argument-torrenting-port)
   (qbittorrent-transient--argument-no-splash)
   (qbittorrent-transient--argument-profile)
   (qbittorrent-transient--argument-configuration)
   (qbittorrent-transient--argument-relative-fastresume)]
  ["qBittorrent options when adding new torrents"
   (qbittorrent-transient--argument-save-path)
   (qbittorrent-transient--argument-add-stopped)
   (qbittorrent-transient--argument-skip-hash-check)
   (qbittorrent-transient--argument-category)
   (qbittorrent-transient--argument-sequential)
   (qbittorrent-transient--argument-first-and-last)
   (qbittorrent-transient--argument-skip-dialog)]
  ["Download the torrents passed by the user"
   ("f" "From file" qbittorrent-transient-filepath)
   ("u" "From URL" qbittorrent-transient-url)
   ("m" "From Dired marked files" qbittorrent-transient-dired)]
  ["qBittorrent command"
   ("!" "Command" qbittorrent-transient-command)])

(defun qbittorrent-transient--read-true-or-false (prompt _initial-input _history)
  "Ask user a y or n question, then return a true or false string depending
or the return value."
  (if (y-or-n-p prompt) "true" "false"))

(defun qbittorrent-transient-command ()
  "Run a qbittorrent command."
  (interactive)
  (let* ((prompt (format "Async shell command in %s: " (abbreviate-file-name default-directory)))
         (command (read-shell-command prompt (format "%s " qbittorrent-transient-qbittorrent-path))))
    (async-shell-command command)))

(defun qbittorrent-transient--exec (arguments)
  "Execute a qbittorrent command with given ARGUMENTS."
  (unless qbittorrent-transient-qbittorrent-path
    (error "Missing the qbittorrent executable"))
  (let ((command (cons qbittorrent-transient-qbittorrent-path
		       (append arguments qbittorrent-transient-extra-arguments)))
	(sentinel (lambda (proc _)
		    (let ((status (process-exit-status proc)))
		      (unless (equal status 0)
			(error "%s failed with status code %s" proc status))))))
    (make-process :name qbittorrent-transient-qbittorrent-path
                  :buffer nil
                  :command command
		  :sentinel sentinel)))

(defun qbittorrent-transient--arguments ()
  "Returns the current transient arguments."
  (flatten-list (transient-args transient-current-command)))

(defun qbittorrent-transient-filepath (filepath &rest arguments)
  "Run qbittorrent with a FILEPATH and given ARGUMENTS."
  (interactive (flatten-list (list
			      (read-file-name "File: " nil nil t)
			      (qbittorrent-transient--arguments))))
  (qbittorrent-transient--exec (cons (expand-file-name filepath) arguments)))

(defun qbittorrent-transient-url (url &rest arguments)
  "Run qbittorrent with a URL and given ARGUMENTS."
  (interactive (flatten-list (list
			      (read-string "URL: " nil nil nil)
			      (qbittorrent-transient--arguments))))
  (qbittorrent-transient--exec (cons url arguments)))

(defun qbittorrent-transient-dired (&rest arguments)
  "Run qbittorrent with a URL and given ARGUMENTS."
  (interactive (qbittorrent-transient--arguments))
  (let ((dired-marked-files (dired-get-marked-files nil 'marked)))
    (qbittorrent-transient--exec (append dired-marked-files arguments))))

(provide 'qbittorrent-transient)

;;; qbittorrent-transient.el ends here
