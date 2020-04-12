;; user-config: the last loading configuration

;;解决org表格里面中英文对齐的问题 
(when (configuration-layer/layer-usedp 'chinese)
  (when (and (spacemacs/system-is-mac) window-system)
    (spacemacs//set-monospaced-font "Source Code Pro" "Hiragino Sans GB" 14 16)))

(provide 'user-config)
