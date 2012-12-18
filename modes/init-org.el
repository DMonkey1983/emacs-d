(use-package org
  :mode ("\\.org$" . org-mode)
  :config
  (progn
    ;; auto-wrap
    (add-hook 'org-mode-hook 'bw-turn-on-auto-fill)

    ;; edit inline code blocks natively
    (setq
     org-src-fontify-natively t
     org-src-tab-acts-natively t)

    ;; Show other programming languages semi-natively when embedded
    (org-babel-do-load-languages
     'org-babel-load-languages
     ;; load emacs-lisp natively
     '((emacs-lisp . t)
       (ruby . t)))

    ;; default directory
    (setq org-directory "~/Dropbox/Org/")))

(provide 'init-org)
