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

;; 在spacemacs.env中设置JAVA_HOME不起作用。。。
(setenv "JAVA_HOME" "/etc/java-config-2/current-system-vm")

;; Org配置
(with-eval-after-load 'org
  ;; 设置默认Org Agenda文件目录
  (setq org-agenda-files '("~/agenda"))
  ;; 设置隐藏标题的省略号图标
  (setq org-ellipsis "⤵")
  )

;; company设置激活字符数
(setq company-minimum-prefix-length 3)

;; pyvenv需要的设定虚拟环境的变量
(setenv "WORKON_HOME" "~/developtool/miniconda/envs")

;; 自定义中文字体
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font (frame-parameter nil 'font)
;;                     charset (font-spec :family "Microsoft Yahei" :size 16)))
