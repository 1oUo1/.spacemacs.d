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


;; 字体配置
;; 设置汉字字体
;; (set-fontset-font t 'han (font-spec :family "Hanyi Senty Yongle Encyclopedia" :size 15.0))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset (font-spec :family "HYJinKaiJ" :size 15.0)))

