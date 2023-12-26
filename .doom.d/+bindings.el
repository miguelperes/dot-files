(defun scroll-up-bottom-window ()
  "Scroll up bottom window"
  (interactive)
  (save-selected-window
    (when-let ((bottom-window (-first (lambda (w)
                                        (and (window-full-width-p w)
                                             (not (eq w (get-buffer-window))))) (window-list))))
      (select-window bottom-window)
      (scroll-up-line))))

(defun scroll-down-bottom-window ()
  "Scroll down bottom window"
  (interactive)
  (save-selected-window
    (when-let ((bottom-window (-first (lambda (w)
                                        (and (window-full-width-p w)
                                             (not (eq w (get-buffer-window))))) (window-list))))
      (select-window bottom-window)
      (scroll-down-line))))

(map! :nv
      :desc "Evil multiedit word"
      "M-r" #'evil-multiedit-match-all)

(map! :nvi
      :desc "Expand region"
      "M-=" #'er/expand-region

      :desc "Reverse expand region"
      "M--" (lambda () (interactive) (er/expand-region -1)))

(map! :nvi

      :desc "scroll up bottom window"
      "C-M-S-<down>" #'scroll-up-bottom-window

      :desc "scroll down bottom window"
      "C-M-S-<up>" #'scroll-down-bottom-window

      :desc "increase window width"
      "C-S-<left>" (lambda () (interactive) (enlarge-window 5 t))

      :desc "decrease window width"
      "C-S-<right>" (lambda () (interactive) (enlarge-window -5 t))

      :desc "increase window height"
      "C-S-<down>" (lambda () (interactive) (enlarge-window 5))

      :desc "decrease window height"
      "C-S-<up>" (lambda () (interactive) (enlarge-window -5)))

(after! paredit
  (define-key paredit-mode-map (kbd "C-<left>") nil)
  (define-key paredit-mode-map (kbd "C-<right>") nil)

  (map! :nvi

        :desc "Forward barf"
        "M-<left>" #'paredit-forward-barf-sexp

        :desc "Forward slurp"
        "M-<right>" #'paredit-forward-slurp-sexp

        :desc "Backward slurp"
        "M-S-<left>" #'paredit-backward-slurp-sexp

        :desc "Backward barf"
        "M-S-<right>" #'paredit-backward-barf-sexp

        :desc "Backward"
        "C-c <left>" #'paredit-backward

        :desc "Forward"
        "C-c <right>" #'paredit-forward))
