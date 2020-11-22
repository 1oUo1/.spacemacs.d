;;; funcs.el ---  ouo-programming Layer functions File
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:
;; URL:
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; C++ mode compile & run function
(defun ouo-programming/g++-compile-and-run ()
  (interactive)
  (compile (format "g++ %s && ./a.out" (buffer-file-name))))
