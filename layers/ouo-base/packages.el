;;; packages.el --- ouo-base layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:
;; URL:
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `ouo-base-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `ouo-base/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `ouo-base/pre-init-PACKAGE' and/or
;;   `ouo-base/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst ouo-base-packages
  '(
    rime
    )
  "The list of Lisp packages required by the ouo-base layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun ouo-base/init-rime ()
  (use-package rime
    :config
    (setq rime-emacs-module-header-root "/usr/include/emacs-27-vcs/")
    (setq rime-user-data-dir "~/.config/fcitx/rime")

    (setq rime-posframe-properties
          (list :background-color "#333333"
                :foreground-color "#dcdccc"
                :font "HYJinKaiJ"
                :internal-border-width 10))

    (setq default-input-method "rime"
          rime-show-candidate 'posframe)

    ;; (setq rime-inline-ascii-trigger 'shift-l)

    ;; (define-key rime-active-mode-map (kbd "M-j") 'rime-inline-ascii)
    ))


;;; packages.el ends here
