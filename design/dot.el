(defun update_dot_image_buffer ()
  (interactive)
					; save dot file hook does dot command and refresh png buffer
  (let ((current-buffer-name (buffer-name)))
    
  ;; generate png image
    (shell-command (concat "dot -Tpng " current-buffer-name " > "  current-buffer-name ".png"))
  ;; refresh image buffer
    (switch-to-buffer (concat current-buffer-name ".png"))
    (revert-buffer 1 1)
  ;; come back to current buffer
    (switch-to-buffer current-buffer-name)
    )
  )
(add-hook 'after-save-hook 'update_dot_image_buffer)
(remove-hook 'after-save-hook 'update_dot_image_buffer)
