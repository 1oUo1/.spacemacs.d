;;; config.el --- ouo-programming Layer configuration variables File
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:
;; URL:
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; 在spacemacs.env中设置JAVA_HOME不起作用。。。
(setenv "JAVA_HOME" "/etc/java-config-2/current-system-vm")

;; 配置coq-pro-name路径，以及开启proof-three-window-enable
(custom-set-variables '(coq-prog-name "/home/hanye/.opam/4.10.0/bin/coqtop") '(proof-three-window-enable t))

;; nodejs的bin目录，npm安装的都在这里
(add-to-list 'exec-path "/home/hanye/developtool/node/bin" t)

;; 配置一个java的debug template
;; (with-eval-after-load 'dap-mode
;;   (dap-register-debug-template
;;    "My Java Template"
;;    (list :type "java"
;;          :request "launch"
;;          :args ""
;;          :noDebug t
;;          :cwd nil
;;          :stopOnEntry :json-false
;;          :host "localhost"
;;          :request "launch"
;;          :modulePaths []
;;          :classPaths nil
;;          :projectName nil
;;          :mainClass nil)))

;; binding compile and run function with c++-mode
(add-hook 'c++-mode-hook '(lambda () (local-set-key (kbd "<f5>") 'ouo-programming/g++-compile-and-run)))
