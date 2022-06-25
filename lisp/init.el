(setq debug-on-error t)
;; Initialization of packages

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
;; (package-refresh-contents)

;; ;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

(setq use-package-always-defer t)

(display-battery-mode t)
(global-linum-mode t)

;;  ;;; This fixed garbage collection, makes emacs start up faster ; ; ; ; ; ; ;

(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
	gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)

;; ;; Get rid of gross stuff

(if (boundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if (boundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (boundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

(display-line-numbers-mode nil)
(column-number-mode nil)
(set-frame-font "Inconsolata 14" nil t)
(set-face-attribute 'line-number-current-line nil :background "#3B4252")
(set-face-attribute 'line-number-current-line nil :foreground "#81A1C1")

;; ;;
;; ;; MOUSE STUFF
;; ;;

(setq scroll-preserve-screen-position 1)

;; ;; Use spaces, not tabs.
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

;; ;; Start a server upon startup
;; (server-start)

;; ;; 
;; ;;MODELINE
;; ;; 

(use-package doom-modeline
  :ensure t
  :defer nil
  :config
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-buffer-state-icon t)
  (doom-modeline-mode 1))

(use-package nyan-mode
  :ensure t
  :defer nil
  :config
  (setq nyan-animate-nyancat t)
  (setq nyan-wavy-trail t)
  (nyan-mode 1))

;; ;; 
;; ;; VISUALS
;; ;;


(use-package rainbow-delimiters
  :defer nil
  :ensure t
  :config
  (rainbow-delimiters-mode 1))

(load-theme 'doom-material-dark t)
(doom-themes-visual-bell-config)
(global-prettify-symbols-mode +1)

;; ;; 
;; ;; IVY
;; ;;

(use-package ivy
  :defer nil
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package ivy-posframe
  :after (:all ivy)
  :defer nil
  :ensure t
  :config
  (ivy-posframe-mode t)
  (ivy-posframe-display-at-frame-center t))


;; ;; 
;; ;; COMMON LISP AND CLOJURE
;; ;; 

;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
;; (add-to-list 'slime-contribs 'slime-repl)


;; ;; ADJUST PARENS

(use-package paredit
  :ensure t
  :defer nil)

(use-package lispy
  :ensure t
  :defer nil)

(use-package flycheck
  :ensure t)

(use-package company
  :ensure t)

(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
(add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)


(add-to-list 'load-path "")

(use-package cider
  :ensure t
  :defer nil)

(use-package lsp-treemacs
  :ensure t)

(use-package lsp-mode
  :ensure t)


(add-hook 'clojure-mode-hook (lambda ()
                               (lsp)
                               (cider-mode 1)
                               (lispy-mode 1)
                               (paredit-mode 1)))

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
      lsp-lens-enable t
      lsp-signature-auto-activate nil
      lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
      ;; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
      )

;; ;;
;; ;; JS/TS
;; ;;

;; (require 'web-mode)
;; (require 'typescript-mode)

;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (flycheck-add-next-checker 'typescript-tide '(warning . javascript-eslint) 'append)
;;   (setq flycheck-check-syntax-automatically '(save-mode-enabled))
;;   (setq typescript-indent-level 2)
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   (company-mode +1)
;;   (electric-pair-mode +1))

;; (setq company-tooltip-align-annotations t)

;; (defun eslint-fix-file ()
;;   (interactive)
;;   (message "eslint --fix the file" (buffer-file-name))
;;   (call-process-shell-command
;;    (concat "yarn eslint --fix " (buffer-file-name))
;;    nil "*Shell Command Output*" t)
;;   (revert-buffer t t))

;; (add-hook 'web-mode-hook #'setup-tide-mode)
;; ;; (add-hook 'before-save-hook #'eslint-fix-file)
;; (setq web-mode-markup-indent-offset 2
;;       web-mode-css-indent-offset 2
;;       web-mode-code-indent-offset 2
;;       web-mode-block-padding 2
;;       web-mode-comment-style 2

;;       web-mode-enable-css-colorization t
;;       web-mode-enable-auto-pairing t
;;       web-mode-enable-comment-keywords t
;;       web-mode-enable-current-element-highlight t
;;       )

;; (add-hook 'web-mode-hook
;;           (lambda () (pcase (file-name-extension "tsx") (typescript-mode))))

;; ;; 
;; ;; SHELL, KEYS AND INIT PROGRAMS
;; ;;

(defun efs/display-start-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
	           (float-time
	            (time-subtract after-init-time before-init-time)))
           gcs-done))

;; (setq-default explicit-shell-file-name "/bin/bash")

(add-hook 'after-init-hook (lambda ()
                             (shell)
			     (delete-other-windows)
			     (interactive)
			     (start-process-shell-command "xinput --set-prop 12 'libinput Accel Speed' 0.8" nil "xinput --set-prop 12 'libinput Accel Speed' 0.8")
			     (efs/display-start-time)
			     (global-prettify-symbols-mode +1)))

(add-hook 'shell-mode-hook (lambda ()
			     display-line-numbers-mode 0))


;; ;; 
;; ;; BACKUPS
;; ;;

(setq backup-directory-alist `(("." . "~/.saves")))

(setq backup-by-copying t)

(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(setq create-lockfiles nil)

(use-package erc-goodies
  :defer nil :after erc
  :config
  (setq erc-interpret-mirc-color t)
  (setq erc-controls-highlight-regexp
        (concat
         "\\(\\|\\|\\|\x1e\\|\\|\\|\\|\\|"
         "\\([0-9][0-9]?\\)?\\(,\\([0-9][0-9]?\\)\\)?\\)"
         "\\([^\x1e]*\\)")))

;;
;; Ocaml
;; 

(add-to-list 'auto-mode-alist '("\\.ml[iylp]?$" . caml-mode))
(autoload 'caml-mode "caml" "Major mode for editing OCaml code." t)
(autoload 'run-caml "inf-caml" "Run an inferior OCaml process." t)
(autoload 'camldebug "camldebug" "Run ocamldebug on program." t)
(add-to-list 'interpreter-mode-alist '("ocamlrun" . caml-mode))
(add-to-list 'interpreter-mode-alist '("ocaml" . caml-mode))

(require 'merlin)
(require 'merlin-company)
;(add-to-list 'company-backends 'merlin-company-backend)
(add-hook 'caml-mode-hook 'merlin-mode t)
(setq merlin-use-auto-complete-mode 'easy)
(setq merlin-command 'opam)
(setq merlin-error-on-single-line t)

(require 'ocp-indent)
(setq ocp-indent-path
     (concat
      (replace-regexp-in-string "\n$" ""
          (shell-command-to-string "opam config var bin")) "/ocp-indent"))
(setq ocp-indent-config "strict_with=always,match_clause=4,strict_else=never")


;;
;; Ada
;;


;; ADA Mode because the emacs package sucks really really badly

(eval-when-compile
  (require 'rx))

(defconst my-ada--font-lock-defaults
  (let ((keywords '("elsif" "end" "begin" "procedure " "function " "is" "for " "in " "=>" "case" "when " "loop" "range " "mod " "others" "Null" "Return" "return" "declare" "if" "then" "else" ".."))
        (types '("str" "subtype" "record" "u8" "u16" "u32" "type" " constant " "of" "array" ":= " ":"))
        (preprocessing '("use" "with")))
    `(((,(rx-to-string `(: (or ,@keywords))) 0 font-lock-keyword-face)
       (,(rx-to-string `(: (or ,@preprocessing))) 0 font-lock-preprocessor-face)
       ("\\-\\-.*$" 0 font-lock-comment-face)
       (,(rx-to-string `(: (or ,@types))) 0 font-lock-type-face)))))

(defvar my-ada-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?\{ "(}" st)
    (modify-syntax-entry ?\} "){" st)
    (modify-syntax-entry ?\( "()" st)

    ;; - and _ are word constituents
    ;; (modify-syntax-entry ?_ "w" st)
    ;; (modify-syntax-entry ?- "w" st)

    ;; both single and double quotes makes strings
    (modify-syntax-entry ?\" "\"" st)
    (modify-syntax-entry ?' "'" st)

    ;; add comments. lua-mode does something similar, so it shouldn't
    ;; bee *too* wrong.
    (modify-syntax-entry ?- "--" st)
    ;; (modify-syntax-entry ? ">" st)

    ;; '==' as punctuation
    (modify-syntax-entry ?= ".")
    st))

(defvar my-ada-mode-abbrev-table nil
  "Abbreviation table used in `nps-mode' buffers.")

(define-abbrev-table 'my-ada-mode-abbrev-table
  '())


(define-derived-mode my-ada-mode prog-mode "Ada"
  "Major mode for nps files."
  :abbrev-table my-ada-mode-abbrev-table
  (setq font-lock-defaults my-ada--font-lock-defaults)
  (setq-local comment-start "--")
  ;; (setq-local comment-start-skip "#+[\t ]*")
  ;; (setq-local indent-line-function #'nps-indent-line)
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 3)
  (setq-local indent-line-function 'insert-tab)
  )


(add-to-list 'auto-mode-alist '("\\.adb" . my-ada-mode))

;;
;; ORG MODE
;;

(use-package org-journal
  :ensure t
  :defer t)

(use-package org-pomodoro
  :ensure t
  :defer t)

(setq org-pomodoro-length 25)
(setq org-pomodoro-short-break-length 5)
(setq org-pomodoro-long-break-length 15)
(setq org-pomodoro-play-sounds 1)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-support-shift-select t)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212121" "#f57373" "#c3e88d" "#ffcb6b" "#82aaff" "#c792ea" "#89DDFF" "#EEFFFF"])
 '(custom-safe-themes
   '("84b14a0a41bb2728568d40c545280dbe7d6891221e7fbe7c2b1c54a3f5959289" "76ed126dd3c3b653601ec8447f28d8e71a59be07d010cd96c55794c3008df4d7" "266ecb1511fa3513ed7992e6cd461756a895dcc5fef2d378f165fed1c894a78c" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "3d47380bf5aa650e7b8e049e7ae54cdada54d0637e7bac39e4cc6afb44e8463b" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "6c98bc9f39e8f8fd6da5b9c74a624cbb3782b4be8abae8fd84cbc43053d7c175" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" default))
 '(exwm-floating-border-color "#303030")
 '(fci-rule-color "#585858")
 '(highlight-tail-colors ((("#31342b") . 0) (("#2b3337") . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#171F24" "#c792ea"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#171F24" "#c3e88d"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#171F24" "#585858"))
 '(objed-cursor-color "#f57373")
 '(package-selected-packages
   '(dired-ranger slime org-pomodoro use-package shrink-path all-the-icons))
 '(pdf-view-midnight-colors (cons "#EEFFFF" "#212121"))
 '(rustic-ansi-faces
   ["#212121" "#f57373" "#c3e88d" "#ffcb6b" "#82aaff" "#c792ea" "#89DDFF" "#EEFFFF"])
 '(safe-local-variable-values
   '((cider-clojure-cli-global-options . "-A:dev")
     (cider-repl-init-code "(start)")
     (cider-ns-refresh-after-fn . "dev-extras/resume")
     (cider-ns-refresh-before-fn . "dev-extras/suspend")))
 '(vc-annotate-background "#212121")
 '(vc-annotate-color-map
   (list
    (cons 20 "#c3e88d")
    (cons 40 "#d7de81")
    (cons 60 "#ebd476")
    (cons 80 "#ffcb6b")
    (cons 100 "#fcb66b")
    (cons 120 "#f9a16b")
    (cons 140 "#F78C6C")
    (cons 160 "#e78e96")
    (cons 180 "#d690c0")
    (cons 200 "#c792ea")
    (cons 220 "#d687c2")
    (cons 240 "#e57d9a")
    (cons 260 "#f57373")
    (cons 280 "#cd6c6c")
    (cons 300 "#a66565")
    (cons 320 "#7f5e5e")
    (cons 340 "#585858")
    (cons 360 "#585858")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(defun copy-sexpr-at-point ()
  (interactive)
  (save-excursion
    (let ((original-point (point)))
      (forward-sexp)
      (kill-ring-save original-point (point)))
    nil))

(defconst taxi--font-lock-defaults
  (let ((keywords '("type" "namespace" "inherits" "[[" "]]" "model " "{" "}" "by" "import" "*" "/" "enum"))
        (types '("String" "Int" "Date" "Decimal" "->")))
    `(((,(rx-to-string `(: (or ,@keywords))) 0 font-lock-keyword-face)
       ("\\([[:word:]]+\\)\s*(" 1 font-lock-function-name-face)
       (,(rx-to-string `(: (or ,@types))) 0 font-lock-type-face)))))

(defvar taxi-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?\{ "(}" st)
    (modify-syntax-entry ?\} "){" st)
    (modify-syntax-entry ?\( "()" st)

    ;; - and _ are word constituents
    (modify-syntax-entry ?_ "w" st)
    (modify-syntax-entry ?- "w" st)

    ;; both single and double quotes makes strings
    (modify-syntax-entry ?\" "\"" st)
    (modify-syntax-entry ?' "'" st)

    ;; add comments. lua-mode does something similar, so it shouldn't
    ;; bee *too* wrong.
    (modify-syntax-entry ?# "<" st)
    (modify-syntax-entry ?\n ">" st)

    ;; '==' as punctuation
    (modify-syntax-entry ?= ".")
    st))

(defun taxi-indent-line ()
  "Indent current line."
  (let (indent
        boi-p                           ;begin of indent
        move-eol-p
        (point (point)))                ;lisps-2 are truly wonderful
    (save-excursion
      (back-to-indentation)
      (setq indent (car (syntax-ppss))
            boi-p (= point (point)))
      ;; don't indent empty lines if they don't have the in it
      (when (and (eq (char-after) ?\n)
                 (not boi-p))
        (setq indent 0))
      ;; check whether we want to move to the end of line
      (when boi-p
        (setq move-eol-p t))
      ;; decrement the indent if the first character on the line is a
      ;; closer.
      (when (or (eq (char-after) ?\))
                (eq (char-after) ?\}))
        (setq indent (1- indent)))
      ;; indent the line
      (delete-region (line-beginning-position)
                     (point))
      (indent-to (* tab-width indent)))
    (when move-eol-p
      (move-end-of-line nil))))

(define-derived-mode taxi-mode prog-mode "taxi"
  "Major mode for nps files."
  (setq font-lock-defaults taxi--font-lock-defaults)
  (setq-local indent-line-function #'taxi-indent-line)
  (setq-local indent-tabs-mode t))

(add-to-list 'auto-mode-alist '("\\.taxi" . taxi-mode))
