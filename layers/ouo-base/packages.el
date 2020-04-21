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
    lispy
    conda
    elpy
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


;; lisp的结构化编辑工具lispy
(defun ouo-base/init-lispy ()
  (use-package lispy
    :defer t
    :init
    (progn
      (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
      (add-hook 'ielm-mode-hook (lambda () (lispy-mode 1)))
      (add-hook 'inferior-emacs-lisp-mode-hook (lambda () (lispy-mode 1))))
    ))

;; conda插件
(defun ouo-base/init-conda ()
  (use-package conda
    :init
    :defer t
    :config
    (progn
      ;; 设置miniconda的home目录
      (custom-set-variables
       '(conda-anaconda-home "~/developtool/miniconda/"))
      ;; 设置miniconda的env所在目录,注意这里应该是env的上级目录,不是xxx/env/
      (setq conda-env-home-directory (expand-file-name "~/developtool/miniconda/"))
      ;; 设置将当前环境名显示在mode line
      ;; (setq  mode-line-format (cons '(:exec conda-env-current-name) mode-line-format))
      )))

;; Elpy, the Emacs Python IDE
(defun ouo-base/init-elpy ()
  (use-package elpy
    :ensure t
    :init
    (elpy-enable)))


;;; packages.el ends here
