;;; packages.el --- ouo-programming layer packages file for Spacemacs.
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
;; added to `ouo-programming-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `ouo-programming/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `ouo-programming/pre-init-PACKAGE' and/or
;;   `ouo-programming/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst ouo-programming-packages
  '(
    lispy
    ;; elpy
    lpy
    ;; quickrun
    )
  "The list of Lisp packages required by the ouo-programming layer.

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

;; lisp的结构化编辑工具lispy
(defun ouo-programming/init-lispy ()
  (use-package lispy
    :defer t
    :init
    (progn
      (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
      (add-hook 'ielm-mode-hook (lambda () (lispy-mode 1)))
      (add-hook 'inferior-emacs-lisp-mode-hook (lambda () (lispy-mode 1))))
    ))

;; Elpy, the Emacs Python IDE
;; (defun ouo-programming/init-elpy ()
;;   (use-package elpy
;;     :ensure t
;;     :init
;;     (elpy-enable)))

;; lpy, Python IDE
(defun ouo-programming/init-lpy ()
  (use-package lpy
    :hook (python-mode . lpy-mode)))

;; A `extension to execute editing buffer
;; (defun ouo-programming/init-quickrun ()
;;   (use-package quickrun
;;     :ensure t
;;     :init
;;     (quickrun-set-default "c" "c/clang")
;;     ))


;;; packages.el ends here
