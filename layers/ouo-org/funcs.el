;;; funcs.el ---  ouo-org Layer functions File
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:
;; URL:
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; 当org中项目大于等于100时，对于plain list使用原始方案，而不用org-superstar的设定方案（from github）
(defun ouo-org/auto-lightweight-mode ()
  "Start Org Superstar differently depending on the number of lists items."
  (let ((list-items
         (count-matches "^[ \t]*?\\([+-]\\|[ \t]\\*\\)"
                        (point-min) (point-max))))
    (unless (< list-items 100)
      (org-superstar-toggle-lightweight-lists)))
  (org-superstar))
