;; -*-lisp-*-
;;
;; To configure stumpwm

(in-package :stumpwm)

;; change the prefix key to something else
(set-prefix-key (kbd "C-z"))

;; prompt the user for an interactive command. The first arg is an
;; optional initial contents.
(defcommand colon1 (&optional (initial "")) (:rest)
  (let ((cmd (read-one-line (current-screen) ": " :initial-input initial)))
    (when cmd
      (eval-command cmd t))))

;; Read some doc
(define-key *root-map* (kbd "d") "exec gv")
;; Browse somewhere
(define-key *root-map* (kbd "b") "colon1 exec firefox http://www.")
;; Ssh somewhere
(define-key *root-map* (kbd "C-s") "colon1 exec xterm -e ssh ")
;; Lock screen
(define-key *root-map* (kbd "C-l") "exec xlock")


;; Message window font
(set-font "-xos4-terminus-medium-r-normal--14-140-72-72-c-80-iso8859-15")

;;; Define window placement policy...

;; Clear rules
(clear-window-placement-rules)

;; Last rule to match takes precedence!
;; TIP: if the argument to :title or :role begins with an ellipsis, a substring
;; match is performed.
;; TIP: if the :create flag is set then a missing group will be created and
;; restored from *data-dir*/create file.
;; TIP: if the :restore flag is set then group dump is restored even for an
;; existing group using *data-dir*/restore file.
(define-frame-preference "Default"
  ;; frame raise lock (lock AND raise == jumpto)
  (0 t nil :class "Konqueror" :role "...konqueror-mainwindow")
  (1 t nil :class "XTerm"))

(define-frame-preference "Ardour"
  (0 t   t   :instance "ardour_editor" :type :normal)
  (0 t   t   :title "Ardour - Session Control")
  (0 nil nil :class "XTerm")
  (1 t   nil :type :normal)
  (1 t   t   :instance "ardour_mixer")
  (2 t   t   :instance "jvmetro")
  (1 t   t   :instance "qjackctl")
  (3 t   t   :instance "qjackctl" :role "qjackctlMainForm"))

(define-frame-preference "Shareland"
  (0 t   nil :class "XTerm")
  (1 nil t   :class "aMule"))

;;(define-frame-preference "Emacs"
  ;;(1 t t :restore "emacs-editing-dump" :title "...xdvi")
  ;;(0 t t :create "emacs-dump" :class "Emacs"))  



;; Set model-line format
(setf *screen-mode-line-format*
      (list "%g | %v | ^>"
	    '(:eval (string-trim '(#\newline) (stumpwm:run-shell-command "date" t)))
	    "  [Battery: "
	    '(:eval (string-trim '(#\newline) (with-open-file (*standard-input* #p"/sys/class/power_supply/BAT0/capacity")(read-line))))
	    "]"))


(setf *mode-line-timeout* 1)

(toggle-mode-line (current-screen)
        (current-head))

(setf *window-format* "%m%n%s%c")

(setf *hidden-window-color* "^7")


;; Background 
(run-shell-command "feh --bg-center $HOME/Pictures/lainwallpaper.jpg")
(run-shell-command "discord")
;;(run-shell-command "hexchat")
;;(run-shell-command "spotify")
;;(run-shell-command "firefox")
(run-shell-command "guake")
(run-shell-command "xmodmap -e 'clear mod4'")
(run-shell-command "xmodmap -e \'keycode 133 = F20\'")


;;Volume keys
;;Second three are in case ??? for some reason pulseaudio uses different sourcesx
(define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec pactl set-sink-volume 0 +5%")
(define-key *top-map* (kbd "XF86AudioLowerVolume") "exec pactl set-sink-volume 0 -5%")
(define-key *top-map* (kbd "XF86AudioMute") "exec pactl set-sink-mute 0 toggle")
(define-key *top-map* (kbd "C-XF86AudioRaiseVolume") "exec pactl set-sink-volume 1 +5%")
(define-key *top-map* (kbd "C-XF86AudioLowerVolume") "exec pactl set-sink-volume 1 -5%")
(define-key *top-map* (kbd "C-XF86AudioMute") "exec pactl set-sink-mute 1 toggle")
    
;; Backlight control
(define-key *top-map* (kbd "XF86MonBrightnessUp") "exec xbacklight -inc 5")
(define-key *top-map* (kbd "XF86MonBrightnessDown") "exec xbacklight -dec 5")

;;Screenshooter
(define-key *top-map* (kbd "SunPrint_Screen") "exec xfce4-screenshooter")

;;Open appfinder
(define-key *top-map* (kbd "F20") "exec xfce4-appfinder")


;;Hide windows that aren't on top of the stack (for compositor; also the command requires execution)
(defun hide-all-lower-windows (current last)
  (declare (ignore current last))
  (when (typep (current-group) 'stumpwm::tile-group)
    (mapc (lambda (win)
	    (unless (eq win (stumpwm::frame-window
			     (stumpwm::window-frame win)))
	      (stumpwm::hide-window win)))
	  (group-windows (current-group)))))

(defcommand enable-hiding-lower-windows () ()
	    "Enables hiding lower windows obviously"
	    (add-hook *focus-window-hook* 'hide-all-lower-windows))

(enable-hiding-lower-windows)
(run-shell-command "compton --config ~/.config/compton.conf")
