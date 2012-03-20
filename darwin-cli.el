;; nothing to see here

;; Enable the mouse, gotten from:
;; http://www.iterm2.com/#/section/faq
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))

;; Even though we may have set the Mac OS X Terminal's Alt key as the emacs Meta key ...
;; ... we want to be able to insert a '#' using Alt-3 in emacs as we would in other programs
(fset 'insertPound "#")
(define-key global-map "\M-3" 'insertPound)

;; Make sure cut/paste works properly. Gotten from:
;; http://mindlev.wordpress.com/2011/06/13/emacs-in-a-terminal-on-osx/#comment-20
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

;; Override defaults to use the mac copy and paste
(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
