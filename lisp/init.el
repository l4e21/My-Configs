
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "LightSkyBlue4" "SlateGray1" "pale turquoise" "PaleTurquoise4" "#333366" "CadetBlue1" "#f6f3e8"])
 '(custom-enabled-themes '(doom-laserwave))
 '(custom-safe-themes
   '("6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "ca70827910547eb99368db50ac94556bbd194b7e8311cfbdbdcad8da65e803be" "54cf3f8314ce89c4d7e20ae52f7ff0739efb458f4326a2ca075bf34bc0b4f499" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" "5379937b99998e0510bd37ae072c7f57e26da7a11e9fb7bced8b94ccc766c804" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "cae81b048b8bccb7308cdcb4a91e085b3c959401e74a0f125e7c5b173b916bf9" "01cf34eca93938925143f402c2e6141f03abb341f27d1c2dba3d50af9357ce70" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "6b80b5b0762a814c62ce858e9d72745a05dd5fc66f821a1c5023b4f2a76bc910" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "95d0ed21bb0e919be7687a25ad59a1c2c8df78cbe98c9e369d44e65bfd65b167" "aaa4c36ce00e572784d424554dcc9641c82d1155370770e231e10c649b59a074" "b5fff23b86b3fd2dd2cc86aa3b27ee91513adaefeaa75adc8af35a45ffb6c499" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "c086fe46209696a2d01752c0216ed72fd6faeabaaaa40db9fc1518abebaf700d" "75b8719c741c6d7afa290e0bb394d809f0cc62045b93e1d66cd646907f8e6d43" "4a8d4375d90a7051115db94ed40e9abb2c0766e80e228ecad60e06b3b397acab" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "a3bdcbd7c991abd07e48ad32f71e6219d55694056c0c15b4144f370175273d16" "08a27c4cde8fcbb2869d71fdc9fa47ab7e4d31c27d40d59bf05729c4640ce834" "b0334e8e314ea69f745eabbb5c1817a173f5e9715493d63b592a8dc9c19a4de6" default))
 '(display-battery-mode t)
 '(fancy-battery-mode t)
 '(fci-rule-color "#65737E")
 '(global-display-line-numbers-mode t)
 '(ivy-posframe-mode t nil (ivy-posframe))
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#D08770"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#A3BE8C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#4f5b66"))
 '(objed-cursor-color "#BF616A")
 '(package-selected-packages
   '(all-the-icons-ivy beacon battery-notifier mode-icons ivy-posframe inf-elixir alchemist elixir-mode rcirc-notify exwm python-black projectile wgrep adjust-parens paredit nyan-mode rainbow-delimiters slime ivy elpy restart-emacs ivy-explorer doom-themes doom-modeline lispy rust-mode haskell-mode isortify anaconda-mode auto-virtualenv jedi format-all python-mode python))
 '(pdf-view-midnight-colors (cons "#c0c5ce" "#2b303b"))
 '(rustic-ansi-faces
   ["#2b303b" "#BF616A" "#A3BE8C" "#ECBE7B" "#8FA1B3" "#c678dd" "#46D9FF" "#c0c5ce"])
 '(send-mail-function 'mailclient-send-it)
 '(show-paren-mode t)
 '(vc-annotate-background "#2b303b")
 '(vc-annotate-color-map
   (list
    (cons 20 "#A3BE8C")
    (cons 40 "#bbbe86")
    (cons 60 "#d3be80")
    (cons 80 "#ECBE7B")
    (cons 100 "#e2ab77")
    (cons 120 "#d99973")
    (cons 140 "#D08770")
    (cons 160 "#cc8294")
    (cons 180 "#c97db8")
    (cons 200 "#c678dd")
    (cons 220 "#c370b6")
    (cons 240 "#c16890")
    (cons 260 "#BF616A")
    (cons 280 "#a35f69")
    (cons 300 "#875e68")
    (cons 320 "#6b5c67")
    (cons 340 "#65737E")
    (cons 360 "#65737E")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Get rid of gross stuff

(if (boundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if (boundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (boundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

(line-number-mode nil)
(column-number-mode nil)
(set-frame-font "Inconsolata 11" nil t)

 ;; Start a server upon startup
;; (server-start)

;; Melpa

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-refresh-contents)

;; Auto-package installation!

(defvar packagelist
  '(doom-modeline
    nyan-mode
    doom-themes
    ivy
    slime
    elpy
    wgrep
    haskell-mode
    python-black
    ))

(mapcar (lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
	packagelist)


;;MODELINE


(require 'doom-modeline)
(require 'nyan-mode)
(setq nyan-animate-nyancat t)
(setq nyan-wavy-trail t)
(nyan-mode 1)
(doom-modeline-mode 1)
(beacon-mode 1)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)


;; EXTRA VISUALS

(load-theme 'doom-laserwave t)
(doom-themes-visual-bell-config)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(global-prettify-symbols-mode +1)

;; IVY

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(require 'ivy-posframe)
(ivy-posframe-mode 1)

;; ADJUST PARENS

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)



;; PYTHON
;; rgrep to search for keywords in directories, good for finding duplicates
;; C-c C-e to refactor all in a file
;; M-x set-project root to set a project root
;; M-x project-find-file or (C-c C-f) to find a file in a project
;; Select multiple lines and do M-; to comment out multiple lines at a time
;; C-c > and C-c < to insert or reduce tabs for multiple lines at a time

(require 'wgrep)
(require 'python-black)
(setq python-shell-interpreter "/usr/bin/python3")
(add-hook 'python-mode-hook 'elpy-mode)

(elpy-enable)
(setq elpy-rpc-backend "jedi")
(setq elpy-rpc-python-command "python3")

(add-hook 'elpy-mode-hook (lambda ()
			    (add-hook 'before-save-hook 'python-black-buffer)))


;; (add-hook 'elpy-mode-hook (lambda ()
;; 			    (add-hook 'focus-out-hook 'save-buffer)))

;; COMMON LISP


(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
(add-to-list 'slime-contribs 'slime-repl)
(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
(add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))


;; HASKELL


(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)


(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

;; ELIXIR
(require 'elixir-mode)
(require 'alchemist)
;; we want tab completions
(add-hook 'elixir-mode-hook (lambda ()
			      (company-mode 1)
			      (push '(">=" . ?\u2265) prettify-symbols-alist)
			      (push '("<=" . ?\u2264) prettify-symbols-alist)
			      (push '("!=" . ?\u2260) prettify-symbols-alist)
			      (push '("==" . ?\u2A75) prettify-symbols-alist)
			      (push '("=~" . ?\u2245) prettify-symbols-alist)
			      (push '("<-" . ?\u2190) prettify-symbols-alist)
			      (push '("->" . ?\u2192) prettify-symbols-alist)
			      (push '("<-" . ?\u2190) prettify-symbols-alist)
			      (push '("|>" . ?\u25B7) prettify-symbols-alist)
			      (push '("fn" . ?λ) prettify-symbols-alist)))

;; EXWM
(require 'exwm)
(require 'exwm-config)
(exwm-config-example)

(setq exwm-input-global-keys
      `(([?\s-r] . exwm-reset)
        ([?\s-w] . exwm-workspace-switch)
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))
	([?\s-x] . (lambda (command)
		     (interactive (list (read-shell-command "$ ")))
		     (start-process-shell-command command nil command)))
	([?\s-u] . (lambda ()
		     (interactive)
		     (start-process-shell-command "pactl set-sink-volume @DEFAULT_SINK@ +5%" nil "pactl set-sink-volume @DEFAULT_SINK@ +5%")))
	([?\s-d] . (lambda ()
		     (interactive)
		     (start-process-shell-command "pactl set-sink-volume @DEFAULT_SINK@ -5%" nil "pactl set-sink-volume @DEFAULT_SINK@ -5%")))
	([s-left] . windmove-left)
	([s-up] . windmove-up)
	([s-down] . windmove-down)
	([s-right] . windmove-right)))


(start-process-shell-command "xinput --set-prop 12 'libinput Accel Speed' 0.8" nil "xinput --set-prop 12 'libinput Accel Speed' 0.8")

(display-battery-mode 1)
(setq display-time-day-and-date 1)
(display-time-mode 1)
(exwm-enable)

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(85 . 85))
(add-to-list 'default-frame-alist '(alpha . (85 85)))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))



;; SHELL AND INIT

(setq-default explicit-shell-file-name "/bin/bash")
(add-hook 'after-init-hook (lambda ()
			     (shell)
			     (delete-other-windows)
			     (interactive)
			     (start-process-shell-command "feh --bg-scale ~/horsehead.jpg" nil "feh --bg-scale ~/horsehead.jpg")
			     (start-process-shell-command "picom" nil "picom")))
;; (ansi-term "/bin/fish")

(add-hook 'shell-mode-hook (lambda ()
			     display-line-numbers-mode 0))

