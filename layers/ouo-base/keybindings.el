;;; keybindings.el --- ouo-base Layer key bindings File
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:
;; URL:
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; 将occur快捷键绑定为其扩展函数occur-dwim
(global-set-key (kbd "M-s o") 'ouo-base/occur-dwim)
