
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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#242424" "LightSkyBlue4" "SlateGray1" "pale turquoise" "PaleTurquoise4" "#333366" "CadetBlue1" "#f6f3e8"])
 '(compilation-message-face 'default)
 '(custom-enabled-themes '(doom-city-lights))
 '(custom-safe-themes
   '("3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "0fe24de6d37ea5a7724c56f0bb01efcbb3fe999a6e461ec1392f3c3b105cc5ac" "c95813797eb70f520f9245b349ff087600e2bd211a681c7a5602d039c91a6428" "e8567ee21a39c68dbf20e40d29a0f6c1c05681935a41e206f142ab83126153ca" "a131602c676b904a5509fff82649a639061bf948a5205327e0f5d1559e04f5ed" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "7546a14373f1f2da6896830e7a73674ef274b3da313f8a2c4a79842e8a93953e" "0e2a7e1e632dd38a8e0227d2227cb8849f877dd878afb8219cb6bcdd02068a52" "8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e" "f4876796ef5ee9c82b125a096a590c9891cec31320569fc6ff602ff99ed73dca" "4f01c1df1d203787560a67c1b295423174fd49934deb5e6789abd1e61dba9552" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "5a00018936fa1df1cd9d54bee02c8a64eafac941453ab48394e2ec2c498b834a" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "d5a878172795c45441efcd84b20a14f553e7e96366a163f742b95d65a3f55d71" "cbd85ab34afb47003fa7f814a462c24affb1de81ebf172b78cb4e65186ba59d2" "8f5b54bf6a36fe1c138219960dd324aad8ab1f62f543bed73ef5ad60956e36ae" "ffba0482d3548c9494e84c1324d527f73ea4e43fff8dfd0e48faa8fc6d5c2bc7" "57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" "733ef3e3ffcca378df65a5b28db91bf1eeb37b04d769eda28c85980a6df5fa37" "06ed754b259cb54c30c658502f843937ff19f8b53597ac28577ec33bb084fa52" "2ce76d65a813fae8cfee5c207f46f2a256bac69dacbb096051a7a8651aa252b0" "d0fd069415ef23ccc21ccb0e54d93bdbb996a6cce48ffce7f810826bb243502c" "249e100de137f516d56bcf2e98c1e3f9e1e8a6dce50726c974fa6838fbfcec6b" "e266d44fa3b75406394b979a3addc9b7f202348099cfde69e74ee6432f781336" "11cc65061e0a5410d6489af42f1d0f0478dbd181a9660f81a692ddc5f948bf34" "d9a28a009cda74d1d53b1fbd050f31af7a1a105aa2d53738e9aa2515908cac4c" "f00a605fb19cb258ad7e0d99c007f226f24d767d01bf31f3828ce6688cbdeb22" "6128465c3d56c2630732d98a3d1c2438c76a2f296f3c795ebda534d62bb8a0e3" "d516f1e3e5504c26b1123caa311476dc66d26d379539d12f9f4ed51f10629df3" "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041" "b90b8b91f74bfad2ed87b130c34ac14893b363316413515f3dd5d7a6c4cad7fa" "07e8dd73724663b46667bb6d86a23dda182d1506702d21a38db288af7c367d1f" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" "6bffac6f528e43839861be1d7facf8054b57edc1ffc70f7be885da7d181ecbac" "0f2f1feff73a80556c8c228396d76c1a0342eb4eefd00f881b91e26a14c5b62a" "f99318b4b4d8267a3ee447539ba18380ad788c22d0173fc0986a9b71fd866100" "48c02faac1209d3e960e15fa252cc0869aab5f96e6533bcf4619d2e88b74d7ac" "3a78cae35163bb71df460ebcfdebf811fd7bc74eaa15428c7e0bccfd4f858d30" "0feb7052df6cfc1733c1087d3876c26c66410e5f1337b039be44cb406b6187c6" "27a1dd6378f3782a593cc83e108a35c2b93e5ecc3bd9057313e1d88462701fcd" "f703efe04a108fcd4ad104e045b391c706035bce0314a30d72fbf0840b355c2c" "ff3c57a5049010a76de8949ddb629d29e2ced42b06098e046def291989a4104a" "56d10d2b60685d112dd54f4ba68a173c102eacc2a6048d417998249085383da1" "fd22c8c803f2dac71db953b93df6560b6b058cb931ac12f688def67f08c10640" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "2c49d6ac8c0bf19648c9d2eabec9b246d46cb94d83713eaae4f26b49a8183fc4" "0685ffa6c9f1324721659a9cd5a8931f4bb64efae9ce43a3dba3801e9412b4d8" "e27556a94bd02099248b888555a6458d897e8a7919fd64278d1f1e8784448941" "3df5335c36b40e417fec0392532c1b82b79114a05d5ade62cfe3de63a59bc5c6" "f94110b35f558e4c015b2c680f150bf8a19799d775f8352c957d9d1054b0a210" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "0a41da554c41c9169bdaba5745468608706c9046231bbbc0d155af1a12f32271" "e3c64e88fec56f86b49dcdc5a831e96782baf14b09397d4057156b17062a8848" "f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "5ed25f51c2ed06fc63ada02d3af8ed860d62707e96efc826f4a88fd511f45a1d" "de1f10725856538a8c373b3a314d41b450b8eba21d653c4a4498d52bb801ecd2" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "ca70827910547eb99368db50ac94556bbd194b7e8311cfbdbdcad8da65e803be" "54cf3f8314ce89c4d7e20ae52f7ff0739efb458f4326a2ca075bf34bc0b4f499" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" "5379937b99998e0510bd37ae072c7f57e26da7a11e9fb7bced8b94ccc766c804" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "cae81b048b8bccb7308cdcb4a91e085b3c959401e74a0f125e7c5b173b916bf9" "01cf34eca93938925143f402c2e6141f03abb341f27d1c2dba3d50af9357ce70" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "6b80b5b0762a814c62ce858e9d72745a05dd5fc66f821a1c5023b4f2a76bc910" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "95d0ed21bb0e919be7687a25ad59a1c2c8df78cbe98c9e369d44e65bfd65b167" "aaa4c36ce00e572784d424554dcc9641c82d1155370770e231e10c649b59a074" "b5fff23b86b3fd2dd2cc86aa3b27ee91513adaefeaa75adc8af35a45ffb6c499" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "c086fe46209696a2d01752c0216ed72fd6faeabaaaa40db9fc1518abebaf700d" "75b8719c741c6d7afa290e0bb394d809f0cc62045b93e1d66cd646907f8e6d43" "4a8d4375d90a7051115db94ed40e9abb2c0766e80e228ecad60e06b3b397acab" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "a3bdcbd7c991abd07e48ad32f71e6219d55694056c0c15b4144f370175273d16" "08a27c4cde8fcbb2869d71fdc9fa47ab7e4d31c27d40d59bf05729c4640ce834" "b0334e8e314ea69f745eabbb5c1817a173f5e9715493d63b592a8dc9c19a4de6" default))
 '(display-battery-mode t)
 '(doom-modeline-mode t)
 '(fancy-battery-mode t)
 '(fci-rule-color "#65737E")
 '(fringe-mode 6 nil (fringe))
 '(global-display-line-numbers-mode t)
 '(highlight-changes-colors '("#EF5350" "#7E57C2"))
 '(highlight-tail-colors
   '(("#010F1D" . 0)
     ("#B44322" . 20)
     ("#34A18C" . 30)
     ("#3172FC" . 50)
     ("#B49C34" . 60)
     ("#B44322" . 70)
     ("#8C46BC" . 85)
     ("#010F1D" . 100)))
 '(ivy-posframe-mode t nil (ivy-posframe))
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#D08770"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#A3BE8C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#4f5b66"))
 '(linum-format 'dynamic)
 '(magit-diff-use-overlays nil)
 '(objed-cursor-color "#BF616A")
 '(package-selected-packages
   '(ac-slime tss ssh-tunnels lsp-mode rustic py-autopep8 js-comint ts-comint smartparens tide typescript-mode hy-mode magit cider cherry-blossom-theme nimbus-theme night-owl-theme lush-theme tao-theme stimmung-themes kaolin-themes almost-mono-themes afternoon-theme moe-theme racket-mode exwm-mff use-package brutalist-theme org-pomodoro all-the-icons-ivy beacon battery-notifier mode-icons ivy-posframe inf-elixir alchemist elixir-mode rcirc-notify exwm python-black projectile wgrep adjust-parens paredit nyan-mode rainbow-delimiters slime ivy elpy restart-emacs ivy-explorer doom-themes doom-modeline lispy rust-mode haskell-mode isortify anaconda-mode auto-virtualenv jedi format-all python-mode python))
 '(pdf-view-midnight-colors (cons "#c0c5ce" "#2b303b"))
 '(pos-tip-background-color "#2a2931")
 '(pos-tip-foreground-color "#d4d4d6")
 '(rustic-ansi-faces
   ["#2b303b" "#BF616A" "#A3BE8C" "#ECBE7B" "#8FA1B3" "#c678dd" "#46D9FF" "#c0c5ce"])
 '(send-mail-function 'mailclient-send-it)
 '(show-paren-mode t)
 '(size-indication-mode t)
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
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#011627" "#010F1D" "#DC2E29" "#EF5350" "#D76443" "#F78C6C" "#D8C15E" "#FFEB95" "#5B8FFF" "#82AAFF" "#AB69D7" "#C792EA" "#AFEFE2" "#7FDBCA" "#D6DEEB" "#FFFFFF")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "#747474")))))
; ; ; This fixed garbage collection, makes emacs start up faster ; ; ; ; ; ; ;
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
;; (add-hook 'emacs-startup-hook (lambda ()
;; 				(interactive)
;; 				(start-process-shell-command "feh --bg-scale ~/solarizedpape.png" nil "feh --bg-scale ~/solarizedpape.png")
;; 				(start-process-shell-command "picom" nil "picom")))


;; Get rid of gross stuff

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
(set-frame-font "Inconsolata 12" nil t)

;;
;; MOUSE STUFF
;;

(setq scroll-preserve-screen-position 1)
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))


;; Use spaces, not tabs.
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

;; Start a server upon startup
(server-start)

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

(setq use-package-always-defer t)

;; Melpa

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; (package-refresh-contents)

;; Auto-package installation!

;; (defvar packagelist
;;   '(doom-modeline
;;     nyan-mode
;;     doom-themes
;;     ivy
;;     slime
;;     elpy
;;     wgrep
;;     haskell-mode
;;     python-black
;;     ))

;; (mapcar (lambda (package)
;; 	  (unless (package-installed-p package)
;; 	    (package-install package)))
;; 	packagelist)




;; 
;;MODELINE
;; 

(use-package doom-modeline
  :defer nil
  :config
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-buffer-state-icon t)
  (doom-modeline-mode 1))

(use-package nyan-mode
  :defer nil
  :config
  (setq nyan-animate-nyancat t)
  (setq nyan-wavy-trail t)
  (nyan-mode 1))

;; 
;; VISUALS
;;

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; (use-package rainbow-delimiters
;;   :defer nil
;;   :config
;;   (rainbow-delimiters-mode 1))

;; (load-theme 'doom-acario-light t)
(doom-themes-visual-bell-config)
(global-prettify-symbols-mode +1)

(require 'beacon)
(beacon-mode 1)

;; 
;; IVY
;;

(use-package ivy
  :defer nil2
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package ivy-posframe
	     :after (:all ivy)
	     :config
	     (ivy-posframe-mode 1))


;; 
;; ORG MODE
;;

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/ob-racket/ob-racket.el"))


(org-babel-do-load-languages 'org-babel-load-languages
			     '((python . t)))

(setq org-confirm-babel-execute nil)
(setq org-support-shift-select t)

(add-hook 'org-mode-hook 'org-indent-mode)

;; 
;; PYTHON
;; rgrep to search for keywords in directories, good for finding duplicates
;; C-c C-e to refactor all in a file
;; M-x set-project root to set a project root
;; M-x project-find-file or (C-c C-f) to find a file in a project
;; Select multiple lines and do M-; to comment out multiple lines at a time
;; C-c > and C-c < to insert or reduce tabs for multiple lines at a time

;; (use-package elpy
;;   :init
;;   (setq python-shell-interpreter "/usr/bin/python3")
;;   (elpy-enable)
;;   (setq elpy-rpc-backend "jedi")
;;   (setq elpy-rpc-python-command "python3")
;;   :hook 'python-mode-hook)

(require 'elpy)
(setq python-shell-interpreter "/usr/bin/python3")
(elpy-enable)
(setq elpy-rpc-backend "jedi")
(setq elpy-rpc-python-command "python3")


(add-hook 'python-mode-hook (lambda ()
                              (elpy-mode 1)
                              (electric-pair-mode 1)
                              (flycheck-mode 1)
                              (py-autopep8-enable-on-save 1)))

(setq py-autopep8-options '("--max-line-length=120"))

;; (use-package python-black
;;   :after (:all elpy))

;; (require 'python-black)
(require 'wgrep)

;; (setq python-black-extra-args '("--line-length=116"))

(add-hook 'elpy-mode-hook (lambda ()
                            ;; (add-hook 'before-save-hook (lambda ()
                            ;;                               (py-autopep8-buffer)))
			    ;; (add-hook 'before-save-hook (lambda ()
			    ;;     			  (ignore-errors
			    ;;     			    (python-black-buffer))))
			    (display-line-numbers-mode t)))


(use-package hy-mode
  :defer t)
(add-hook 'hy-mode-hook (lambda ()
                          (push '("->" . ?\u25B7) prettify-symbols-alist)
			  (push '("fn" . ?λ) prettify-symbols-alist)
                          (lispy-mode)))

;; 
;; (add-hook 'elpy-mode-hook (lambda ()
;; 			    (add-hook 'focus-out-hook 'save-buffer)))

;; 
;; COMMON LISP AND CLOJURE
;; 

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
(add-to-list 'slime-contribs 'slime-repl)
(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
(add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))

(require 'ac-slime)
    (add-hook 'slime-mode-hook 'set-up-slime-ac)
    (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
    (eval-after-load "auto-complete"
      '(add-to-list 'ac-modes 'slime-repl-mode))

;; ADJUST PARENS

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)


(add-to-list 'load-path "")

(add-hook 'clojure-mode-hook (lambda ()
                               (cider-mode)
                               (lispy-mode 1)
                               (paredit-mode 1)
                               (global-company-mode)))

;; (cider-add-to-alist 'cider-jack-in-dependencies
;;                     "com.cemerick/pomegranate" "0.4.0")
;; 
;; HASKELL
;; 

(use-package haskell-interactive-mode
  :hook haskell-mode-hook)

(use-package haskell-process
  :hook haskell-mode-hook)


;; (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-or-reload)
;; (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
;; (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
;; (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
;; (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;; (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;; (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

;; 
;; ELIXIR
;;

(use-package elixir-mode
  :init
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
  :hook 'elixir-mode-hook)


(use-package alchemist
  :after (:all elixir-mode))

;;
;; JS/TS
;;

(require 'web-mode)
(require 'typescript-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (flycheck-add-next-checker 'typescript-tide '(warning . javascript-eslint) 'append)
  (setq flycheck-check-syntax-automatically '(save-mode-enabled))
  (setq typescript-indent-level 2)
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)
  (electric-pair-mode +1))

(setq company-tooltip-align-annotations t)

(defun eslint-fix-file ()
  (interactive)
  (message "eslint --fix the file" (buffer-file-name))
  (call-process-shell-command
   (concat "yarn eslint --fix " (buffer-file-name))
   nil "*Shell Command Output*" t)
  (revert-buffer t t))

(add-hook 'web-mode-hook #'setup-tide-mode)
;; (add-hook 'before-save-hook #'eslint-fix-file)
(setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-block-padding 2
        web-mode-comment-style 2

        web-mode-enable-css-colorization t
        web-mode-enable-auto-pairing t
        web-mode-enable-comment-keywords t
        web-mode-enable-current-element-highlight t
        )

(add-hook 'web-mode-hook
          (lambda () (pcase (file-name-extension "tsx") (typescript-mode))))
;;
;; EXWM
;;

;; (require 'exwm)
;; (require 'exwm-config)

;; (exwm-config-default)

;; (setq exwm-input-global-keys
;;       `(([?\s-r] . exwm-reset)
;;         ([?\s-w] . exwm-workspace-switch)
;;         ,@(mapcar (lambda (i)
;;                     `(,(kbd (format "s-%d" i)) .
;; 		      (lambda ()
;;                         (interactive)
;;                         (exwm-workspace-switch-create ,i))))
;;                   (number-sequence 0 9))
;; 	([?\s-x] . (lambda (command)
;; 		     (interactive (list (read-shell-command "$ ")))
;; 		     (start-process-shell-command command nil command)))
;; 	([?\s-u] . (lambda ()
;; 		     (interactive)
;; 		     (start-process-shell-command "pactl set-sink-volume @DEFAULT_SINK@ +5%" nil "pactl set-sink-volume @DEFAULT_SINK@ +5%")))
;; 	([?\s-d] . (lambda ()
;; 		     (interactive)
;; 		     (start-process-shell-command "pactl set-sink-volume @DEFAULT_SINK@ -5%" nil "pactl set-sink-volume @DEFAULT_SINK@ -5%")))
;; 	([s-left] . windmove-left)
;; 	([s-up] . windmove-up)
;; 	([s-down] . windmove-down)
;; 	([s-right] . windmove-right)
;; 	([?\s-h] . windmove-left)
;; 	([?\s-k] . windmove-up)
;; 	([?\s-j] . windmove-down)
;; 	([?\s-l] . windmove-right)
;; 	;; ([s-S-h] . windmove-swap-states-left)
;; 	;; ([s-S-k] . windmove-swap-states-up)
;; 	;; ([s-S-j] . windmove-swap-states-down)
;; 	;; ([s-S-l] . windmove-swap-states-right)
;; 	([s-S-left] . windmove-swap-states-left)
;; 	([s-S-up] . windmove-swap-states-up)
;; 	([s-S-down] . windmove-swap-states-down)
;; 	([s-S-right] . windmove-swap-states-right)))

;; (exwm-enable)

;; (use-package exwm-mff
;;   :defer nil
;;   :config
;;   (exwm-mff-mode 1))


;; (start-process-shell-command "xinput --set-prop 12 'libinput Accel Speed' 0.8" nil "xinput --set-prop 12 'libinput Accel Speed' 0.8")

(display-battery-mode 1)
(setq display-time-day-and-date 1)
(display-time-mode 1)
;; (exwm-enable)

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 90)))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))




;; 
;; SHELL, KEYS AND INIT PROGRAMS
;;

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
			     ;; (start-process-shell-command "feh --bg-scale ~/horsehead.jpg" nil "feh --bg-scale ~/horsehead.jpg")
			     ;; (start-process-shell-command "picom" nil "picom")
			     (start-process-shell-command "xinput --set-prop 12 'libinput Accel Speed' 0.8" nil "xinput --set-prop 12 'libinput Accel Speed' 0.8")
			     (efs/display-start-time)
			     (global-prettify-symbols-mode +1)))

;; (ansi-term "/bin/fish")

(add-hook 'shell-mode-hook (lambda ()
			     display-line-numbers-mode 0))

(global-set-key (kbd "C-x e") 'shell)

;;
;; RUST
;;

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t)))

;; 
;; GLOBAL KEYBINDS
;;

(defun triple-split ()
  (interactive)
  (split-window-horizontally)
  (split-window-horizontally)
  (balance-windows))

(global-set-key (kbd "C-x .") 'triple-split)


;; 
;; BACKUPS
;;

(setq backup-directory-alist `(("." . "~/.saves")))

(setq backup-by-copying t)

(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(setq create-lockfiles nil)

;; (global-set-key ["C-c r"] 'rgrep)


;;
;; SQL
;;

;; Remove all default login parameters
;; (setq sql-postgres-login-params
;;       '((user :default "devuser")
;;         (database :default "waymark_app_pgsql_dev")
;;         (server :default "waymark-app-pgsql-dev.c7xrjh49xoxv.eu-west-2.rds.amazonaws.com")
;;         (port :default 5432)))

(setq sql-connection-alist
      '((waymark
         (sql-product 'postgres)
         (sql-default-directory "/ssh:waymark:/")
         (sql-server "waymark-app-pgsql-dev.c7xrjh49xoxv.eu-west-2.rds.amazonaws.com")
         (sql-user "devuser")
         (sql-password "postgres")
         (sql-database "waymark_app_pgsql_dev")
         (sql-port 5432))))

(defun sql-connect-preset (name)
  "Connect to a predefined SQL connection listed in `sql-connection-alist'"
  (eval `(let ,(cdr (assoc name sql-connection-alist))
    (flet ((sql-get-login (&rest what)))
      (sql-product-interactive sql-product)))))

(defun sql-waymark ()
  (interactive)
  (sql-connect-preset 'waymark))


;; 
;; more keys
;;

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(bind-key "\C-x \C-b" 'counsel-switch-buffer-other-window)
(bind-key "\C-x b" 'counsel-switch-buffer)


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



(defun shift-line-back ()
  (interactive)
  (indent-rigidly-left-to-tab-stop (line-beginning-position) (line-end-position)))

(defun shift-line-forth ()
  (interactive)
  (indent-rigidly-right-to-tab-stop (line-beginning-position) (line-end-position)))


(define-derived-mode my-ada-mode prog-mode "Ada"
  "Major mode for nps files."
  :abbrev-table my-ada-mode-abbrev-table
  (setq font-lock-defaults my-ada--font-lock-defaults)
  (setq-local comment-start "--")
  ;; (setq-local comment-start-skip "#+[\t ]*")
  ;; (setq-local indent-line-function #'nps-indent-line)
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 4)
  (setq-local indent-line-function 'insert-tab)
  )


;; ;; (defvar nps-mode-map
;; ;;   (let ((map (make-sparse-keymap)))
;; ;;     (define-key map "C-c c" #'do-stuff)
;; ;;     ...
;; ;;     map)) ; don’t forget to return the map here!

(add-to-list 'auto-mode-alist '("\\.adb" . my-ada-mode))


;; More bindings
(defun insert-line-below ()
  "Insert an empty line below the current line."
  (interactive)
  (save-excursion
    (end-of-line)
    (open-line 1)))

(defun insert-line-above ()
  "Insert an empty line above the current line."
  (interactive)
  (save-excursion
    (end-of-line 0)
    (open-line 1)))

(global-set-key (kbd "C-n") 'insert-line-below)
(global-set-key (kbd "C-p") 'insert-line-above)
(global-set-key (kbd "C-b") 'beginning-of-line)
(global-set-key (kbd "C-<tab>") 'shift-line-back)
(global-set-key (kbd "<backtab>") 'shift-line-forth)


