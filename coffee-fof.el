;;; coffee-fof.el --- A `ff-find-other-file' wrapper for coffee-mode.el
;; Copyright (C) 2013 Yasuyki Oka

;; Author: Yasuyki Oka <yasuyk@gmail.com>
;; Keywords: coffee-mode
;; Version: 0.0.1
;; Package-Requires: ((coffee-mode "0.4.1"))
;; URL: http://github.com/yasuyk/coffee-fof

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:
;;
;; Introduction:
;;
;; A `ff-find-other-file' wrapper for coffee-mode.el.
;;
;; Find the CoffeeScript or JavaScript file corresponding to this file.
;;
;;
;; Requirements:
;;
;; * `coffee-mode'
;; * `js-mode', `js2-mode' or `js3-mode'
;;
;;
;; Usage:
;;
;; * coffee-find-other-file: `C-c f'
;;
;;   Find the CoffeeScript or JavaScript file corresponding to this
;;   file.  This command is enabled in `coffee-mode', `js-mode',
;;   `js2-mode', `js3-mode'.
;;
;;
;; Configuration:
;;
;; Add the following to your Emacs init file unless using ELPA package:
;;
;;     (require 'coffee-fof) ;; Not necessary if using ELPA package
;;     (coffee-fof-setup-key)
;;
;; If the .coffee files and .js files are in the same directory, a
;; configuration is not necessary as default value of
;; coffee-fof-search-directories is '(".").
;;
;; If the .coffee and .js files are in different directories, for
;; example, .js files are in `js` directory and .coffee files are in
;; `coffee` directory as below, customize
;; `coffee-fof-search-directories`.
;;
;;     .
;;     ├── coffee
;;     │   └── example.coffee
;;     └── js
;;         └── example.js
;;
;;
;;     (custom-set-variables
;;      '(coffee-fof-search-directories
;;       '("." "../*")))
;;
;; If you want to set another key binding, configure as follow.
;;
;;     (coffee-fof-setup-key (kbd "C-c C-f"))
;;
;;

;;; Code:

(defgroup coffee-fof nil
  "Find a coffee/js file corresponding to this one given a pattern."
  :prefix "coffee-fof-"
  :link '(emacs-commentary-link "find-file")
  :group 'find-file)

(defcustom coffee-fof-other-file-alist
  '(("\\.coffee$" (".js")) ("\\.js$" (".coffee")))
  "See the description of the `ff-other-file-alist' variable."
  :type '(repeat (list regexp (choice (repeat string) function)))
  :group 'coffee-fof)

(defcustom coffee-fof-search-directories
  '(".")
  "See the description of the `ff-search-directories' variable."
  :type '(repeat directory)
  :group 'coffee-fof)

(defvar coffee-find-other-file-key
  (kbd "C-c f")
  "A local binding Key as `coffee-find-other-file' commmand.")

;;;###autoload
(defun coffee-find-other-file (&optional in-other-window)
  "Find the CoffeeScript or JavaScript file corresponding to this file.

If optional IN-OTHER-WINDOW is non-nil, find the file in the other window.
For more Information, See `ff-find-other-file' function."
  (interactive "P")
  (let ((ff-other-file-alist coffee-fof-other-file-alist)
        (ff-search-directories coffee-fof-search-directories))
  (call-interactively 'ff-find-other-file)))

(defun coffee-fof-set-key ()
  "Give `coffee-find-other-file-key' a local binding as `coffee-find-other-file'."
  (local-set-key coffee-find-other-file-key 'coffee-find-other-file))

;;;###autoload
(defun coffee-fof-setup-key (&optional key)
  "Give KEY a local binding as `coffee-find-other-file'.

in `js-mode-map', `js2-mode-map', `js3-mode-map' and `coffee-mode-map'."
  (when key
    (setq coffee-find-other-file-key key))
  (add-hook 'js-mode-hook 'coffee-fof-set-key)
  (add-hook 'js2-mode-hook 'coffee-fof-set-key)
  (add-hook 'js3-mode-hook 'coffee-fof-set-key)
  (add-hook 'coffee-mode-hook 'coffee-fof-set-key))

(provide 'coffee-fof)

;; Local Variables:
;; coding: utf-8
;; eval: (checkdoc-minor-mode 1)
;; End:

;;; coffee-fof.el ends here
