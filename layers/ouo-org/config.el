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

;; 配置Agenda目录和隐藏标题的省略号
(with-eval-after-load 'org
  ;; 设置org-directory
  (setq org-directory "~/org")
  ;; 设置默认Org Agenda文件目录
  (setq org-agenda-files '("~/org/gtd/"))
  ;; 设置隐藏标题的省略号图标
  (setq org-ellipsis "⤵")
  )

;; 设置优先级
(with-eval-after-load 'org
  (setq org-highest-priority ?A)
  (setq org-lowest-priority ?D)
  (setq org-default-priority ?B)
  (setq org-priority-faces '(
                             (?A . org-warning)
                             (?B . (:background "DodgerBlue" :foreground "black" :weight bold))
                             (?C . (:foreground "SkyBlur" :weight bold))
                             (?D . (:foreground "DodgerBlue" :weight bold)))))

;; 设置capture
(with-eval-after-load 'org
  ;; 为capture设置默认文件
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  ;; 设置capture
  (setq org-capture-templates
        '(("i" "Inbox" entry (file+headline "~/org/gtd/TaskManage.org" "Inbox")
           "* %?\nTime:%T\nFrom:%F\n")
          ("t" "Tasks" entry (file+headline "~/org/gtd/TaskManage.org" "@Context task")
           "* %?\nTime:%T\nFrom:%F\n")
          ("c" "Calendar" entry (file+headline "~/org/gtd/TaskManage.org" "Calendar")
           "* %?\nTime:%T\nFrom:%F\n")
          ("w" "Wait" entry (file+headline "~/org/gtd/TaskManage.org" "Waiting for task")
           "* %?\nTime:%T\nFrom:%F\n")
          ("p" "Project" entry (file+headline "~/org/gtd/TaskManage.org" "Plan project task")
           "* %?\nTime:%T\nFrom:%F\n")
          ("s" "Someday" entry (file+headline "~/org/gtd/TaskManage.org" "Someday/maybe")
           "* %?\nTime:%T\nFrom:%F\n")
          ("r" "Reference" entry (file+headline "~/org/gtd/TaskManage.org" "Reference")
           "* %?\nTime:%T\nFrom:%F\n")
          )))

;; 设置refile
(with-eval-after-load 'org
  ;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
  (setq org-refile-targets
        '((nil :maxlevel . 9)
          (org-agenda-files :maxlevel . 9)))
  ;; Use full outline paths for refile targets
  (setq org-refile-use-outline-path 'full-file-path)
  ;; Targets complete directly
  (setq org-outline-path-complete-in-steps nil)
  ;; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes 'confirm))

;; 设置archive
(with-eval-after-load 'org
  ;; location for archive
  (setq org-archive-location (concat org-directory "/gtd/_archive/" (format-time-string "%Y%m") "_archive.org::datetree/* Archive from %s"))
  ;; information added to property when a subtree is moved
  (setq org-archive-save-context-info '(time file ltags itags todo category olpath)))
