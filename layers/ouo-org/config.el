;;; config.el --- ouo-org Layer configuration variables File
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:
;; URL:
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; 配置Agenda目录和隐藏标题的省略号
(with-eval-after-load 'org
  ;; 设置默认Org Agenda文件目录
  (setq org-agenda-files '("~/agenda"))
  ;; 设置隐藏标题的省略号图标
  (setq org-ellipsis "⤵")
  )

;; org模式下table的字体配置
;; 单独设置一个fontset,用于org-table，避免被影响
;; 核心思想就是挑选配对的中文和英文字体，然后分别设置期大小，
;; 让一个汉字的宽度正好是两个英文字符的宽度。
(setq fontset-orgtable
      (create-fontset-from-ascii-font "Sarasa Mono SC 15"))
(dolist (charset '(han symbol cjk-misc))
  (set-fontset-font fontset-orgtable charset
                    (font-spec :family "Sarasa Mono SC"
                               :size 15.0)))
(add-hook 'org-mode-hook
          '(lambda ()
             (set-face-attribute 'org-table nil
                                 :font "Sarasa Mono SC 15"
                                 :fontset fontset-orgtable)))


