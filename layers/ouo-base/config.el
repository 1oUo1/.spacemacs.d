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

;; company设置激活字符数
(setq company-minimum-prefix-length 3)

;; 让Emacs重用唯一的一个缓冲区作为Dired Mode显示专用缓冲区

;; Org配置
(with-eval-after-load 'org
  ;; 设置默认Org Agenda文件目录
  (setq org-agenda-files '("~/agenda"))
  ;; 设置隐藏标题的省略号图标
  (setq org-ellipsis "⤵")
  )
