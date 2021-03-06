;;; packages.el --- ouo-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:  <hanye@1ouo1>
;; URL: https://github.com/syl20bnr/spacemacs
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
;; added to `ouo-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `ouo-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `ouo-org/pre-init-PACKAGE' and/or
;;   `ouo-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst ouo-org-packages
  '(
    ;; org-bullets后继者
    org-superstar
    )
  "The list of Lisp packages required by the ouo-org layer.

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

(defun ouo-org/post-init-org-superstar ()
  (use-package org-superstar
    :init
    (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
    :config
    (progn
      ;; This is usually the default, but keep in mind it must be nil
      (setq org-hide-leading-stars nil)
      ;; This line is necessary.
      (setq org-superstar-leading-bullet ?\s)
      (setq org-superstar-headline-bullets-list '("⊙" "☊" "☋" "☌" "☍" "∞"))
      ;; (setq org-superstar-item-bullet-alist '("☊" "☋" "⊙"))
      ;; (setq org-superstar-prettify-item-bullets t)
      ;; (add-hook 'org-mode-hook #'ouo-org/init-org-superstar)
      )))

;;; packages.el ends here
