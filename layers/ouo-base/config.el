;;; config.el --- ouo-base Layer configuration variables File
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:
;; URL:
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; 让符号更好看,比如lambda的显示
(global-prettify-symbols-mode 1)

;; SPC t f : fill-column-indicator开启/关闭边界提示,这里设为80
(setq-default fill-column 80)
