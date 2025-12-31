;;; flymake-ziglint.el --- Flymake for ziglint  -*- lexical-binding: t; -*-

;; Copyright (C) 2024-2026  Shen, Jen-Chieh

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Maintainer: Shen, Jen-Chieh <jcs090218@gmail.com>
;; URL: https://github.com/flymake/flymake-ziglint
;; Version: 0.1.0
;; Package-Requires: ((emacs "26.1") (flymake-easy "0.1"))
;; Keywords: tools

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Flymake for ziglint.
;;

;;; Code:

(require 'flymake)

(require 'flymake-easy)

(defgroup flymake-ziglint nil
  "Flymake support for ziglint."
  :prefix "flymake-ziglint-"
  :group 'flymake
  :link '(url-link :tag "Github" "https://github.com/flymake/flymake-ziglint"))

(defconst flymake-ziglint-err-line-patterns
  '(("^\\(.*\\):\\([0-9]+\\):\\([0-9]+\\): \\(.*\\)" 1 2 3 nil)))

(defun flymake-ziglint-command (_filename)
  "Construct a command that flymake can use to check Zig source (FILENAME)."
  (list "ziglint"))

;;;###autoload
(defun flymake-ziglint-load ()
  "Configure flymake mode to check the current buffer's Zig syntax.

This function is designed to be called in `zig-mode-hook'; it does not alter
flymake's global configuration, so function `flymake-mode' alone will not
suffice."
  (interactive)
  (when (eq 'zig-mode major-mode)
    (flymake-easy-load 'flymake-ziglint-command
                       flymake-ziglint-err-line-patterns
                       'tempdir
                       "ziglint")))

(provide 'flymake-ziglint)
;;; flymake-ziglint.el ends here
