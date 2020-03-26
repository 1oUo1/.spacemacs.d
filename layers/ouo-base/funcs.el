;;; funcs.el ---  ouo-base Layer functions File
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:
;; URL:
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; 是occur的扩展,运行occur时默认光标当下文本
;; dwin = do what i mean.
(defun ouo-base/occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

