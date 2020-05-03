;; user-config: the last loading configuration

;; 配置python虚拟环境
(pyvenv-activate "~/developtool/miniconda/envs/py382")

;; ============================================================
;; 字体配置
;; 设置汉字字体
;; (set-fontset-font t 'han (font-spec :family "Hanyi Senty Yongle Encyclopedia" :size 15.0))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset (font-spec :family "HYJinKaiJ" :size 15.0)))

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

;; 默认Emacs使用文泉驿字体，Org-Mode使用更纱黑体字体，这样既可以解决Org-Mode表格对齐问题，又避免对Emacs其他模式产生影响
;; 默认字体设置好像没用
;; (let ((emacs-font-size 14)
;;       (emacs-font-name "Source Code Pro"))
;;   (set-frame-font (format "%s-%s" (eval emacs-font-name) (eval emacs-font-size)))
;;   (set-fontset-font (frame-parameter nil 'font) 'unicode (eval emacs-font-name)))

;; Org-Mode使用更纱黑体
;; (with-eval-after-load 'org
;;   (defun org-buffer-face-mode-variable ()
;;     (interactive)
;;     (make-face 'width-font-face)
;;     (set-face-attribute 'width-font-face nil :font "Sarasa Mono SC 15")
;;     (setq buffer-face-mode-face 'width-font-face)
;;     (buffer-face-mode))

;;   (add-hook 'org-mode-hook 'org-buffer-face-mode-variable))
;; ============================================================

(provide 'user-config)
