;; -*-lisp-*-
;;
;; To configure stumpwm

;; Paths and modules

(in-package :stumpwm)
(require 'swm-gaps)


;; Important commands to remember
;; C-z ; quit (go back to desktop manager)
;; C-z ; toggle-gaps-off (turn off gaps)



;; Header Gaps
(setf swm-gaps:*head-gaps-size* 0)

;; Inner Gaps
(setf swm-gaps:*inner-gaps-size* 5)

;; Outer Gaps
(setf swm-gaps:*outer-gaps-size* 15)

;; Call command
;; toggle-gaps

(swm-gaps:toggle-gaps-on)



;; Change prefix key and add super_L to modmap
(run-shell-command "xmodmap -e 'clear mod4'")
(run-shell-command "xmodmap -e 'keycode 133 = Super_L'")
(run-shell-command "xmodmap -e 'add mod4 = Super_L'")


(set-prefix-key (kbd "C-z"))

;; Group stuff, gnew to make, gkill to kill

(define-key stumpwm:*root-map* (kbd "Super_L") "gnext")


;; prompt the user for an interactive command. The first arg is an
;; optional initial contents.
(defcommand colon1 (&optional (initial "")) (:rest)
  (let ((cmd (read-one-line (current-screen) ": " :initial-input initial)))
    (when cmd
      (eval-command cmd t))))




;;; Define window placement policy...

;; Clear rules
(clear-window-placement-rules)

;; Last rule to match takes precedence!




;; Get volume

(defun getvolume()
  (run-shell-command "amixer get Master | grep 'Mono:' | awk -F'[][]' '{ print $2 }'" t))




;; Battery

(defun bat-zone-color (bat med crit)
      (cond ((>= bat med) 2)
	    ((and (>= bat crit) (< bat med) 3))
	    (t 1)))

(defun getbat ()
  (parse-integer (with-open-file (*standard-input* #p"/sys/class/power_supply/BAT0/capacity")(read-line))))

(defun check-battery2 ()
  (bat-zone-color (getbat) 55 25))

(defun chargingquery ()
  (let ((chargingq (with-open-file (*standard-input* #p"/sys/class/power_supply/BAT0/status")(read-line))))
    chargingq))


(defun maybecharge (chargingquery)
  (if (string= chargingquery "Charging")
      "+"
      ""))
      
  

(defun formatted-bat ()
  (format nil "^~A ~D%" (check-battery2) (getbat)))



;; Set mode-line format

(setf *mode-line-foreground-color* "#90a7ff")
(setf *mode-line-background-color* "#38394c")

(setf *screen-mode-line-format*
      (list "%g | %v | ^>"
	    "%d  "
	    "[Vol: " 
	    '(:eval (string-trim '(#\newline) (getvolume)))
            "]"
	    "  [Signal: %I]"
	    "  [Life:"
	    '(:eval (string-trim '(#\newline) (formatted-bat)))
	    "^]]"
	    '(:eval (string-trim '(#\newline) (maybecharge (chargingquery))))
	    ))


(setf *mode-line-timeout* 1)

(toggle-mode-line (current-screen)
        (current-head))

(setf *window-format* "%m%n%s%c")

(setf *hidden-window-color* "^7")

(setf *wifi-modeline-fmt* "%p")






;; Background apps to run on startup
(run-shell-command "feh --bg-center $HOME/Pictures/0019.jpg")
;;(run-shell-command "discord")
;;(run-shell-command "hexchat")
;;(run-shell-command "spotify")
;;(run-shell-command "firefox")
(run-shell-command "guake")

;;(run-shell-command "xterm -e fish -c \"curl http://wttr.in && sleep 30\"")

;; Mouse speed alteration for super fast mouse and natural scrolling
(run-shell-command "xinput --set-prop 11 'Device Accel Velocity Scaling' 4")
(run-shell-command "xinput --set-prop 11 'Device Accel Constant Deceleration' 0.6")
(run-shell-command "xinput --set-prop 11 'Synaptics Scrolling Distance' -60 -60")
(run-shell-command "xinput --set-prop 12 'Device Accel Velocity Scaling' 4")
(run-shell-command "xinput --set-prop 12 'Device Accel Constant Deceleration' 0.6")
(run-shell-command "xinput --set-prop 12 'Synaptics Scrolling Distance' -60 -60")

;; Mouse policy sloppy
(setf *mouse-focus-policy* :sloppy)

;;Message & Input Bar

(set-fg-color "#90a7ff")
(set-bg-color "#21252b")
(set-border-color "#21252b")
(set-win-bg-color "#21252b")
(set-focus-color "#61afef")
(set-unfocus-color "#21252b")
(setf *maxsize-border-width* 1)
(setf *transient-border-width* 1)
(setf *normal-border-width* 1)
(set-msg-border-width 10)
(setf *window-border-style* :thin)
(setf *message-window-gravity* :bottom-right)
(setf *message-window-input-gravity* :bottom-right)
(setf *input-window-gravity* :bottom-right)



;;Volume keys (default sink because pulse is dumb and changes default sink if you toggle it too much
(define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec pactl set-sink-volume @DEFAULT_SINK@ +5%")
(define-key *top-map* (kbd "XF86AudioLowerVolume") "exec pactl set-sink-volume @DEFAULT_SINK@ -5%")
(define-key *top-map* (kbd "XF86AudioMute") "exec pactl set-sink-mute @DEFAULT_SINK@ toggle")

    
;; Backlight controls
(define-key *top-map* (kbd "XF86MonBrightnessUp") "exec xbacklight -inc 5")
(define-key *top-map* (kbd "XF86MonBrightnessDown") "exec xbacklight -dec 5")

;;Screenshooter
(define-key *top-map*(kbd "SunPrint_Screen") "exec xfce4-screenshooter")


;;Super based shortcuts for specific applications
(define-key *top-map* (kbd "s-t") "exec thunar") 
(define-key *top-map* (kbd "s-f") "exec firefox")
(define-key *top-map* (kbd "s-d") "exec discord")
(define-key *top-map* (kbd "s-x") "exec xterm")


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







;;
;; WIFI SETTINGS
;;

(defvar *iwconfig-path* "/sbin/iwconfig"
  "Location if iwconfig, defaults to /sbin/iwconfig.")

(defvar *wireless-device* nil
  "Set to the name of the wireless device you want to monitor. If set
  to NIL, try to guess.")

(defvar *wifi-modeline-fmt* "%e %p"
  "The default value for displaying WiFi information on the modeline.
@table @asis
@item %%
A literal '%'
@item %e
Network ESSID
@item %p
Signal quality (with percentage sign)
@item %P
Signal quality (without percentage sign)
@end table
")

(defvar *use-colors* t
  "Use colors to indicate signal quality.")

(defun sig-quality-fmt (qual)
  (if *use-colors*
      (bar-zone-color qual 80 60 40 t)
      ""))

(defun wifi-get-essid (pair)
  (let ((essid (car pair)))
    (format nil "~A" essid)))

(defun wifi-get-signal-quality-pc (pair)
  (let ((qual (cdr pair)))
    (format nil "^[~A~D%^]" (sig-quality-fmt qual) qual)))

(defun wifi-get-signal-quality (pair)
  (let ((qual (cdr pair)))
    (format nil "^[~A~D^]" (sig-quality-fmt qual) qual)))

(defvar *wifi-formatters-alist*
  '((#\e wifi-get-essid)
    (#\p wifi-get-signal-quality-pc)
    (#\P wifi-get-signal-quality)))

(defmacro defun-cached (name interval arglist &body body)
  "Creates a function that does simple caching. The body must be
written in a functional style - the value returned is set as the
prev-val."
  (let ((prev-time (gensym "PREV-TIME"))
        (prev-val (gensym "PREV-VAL"))
        (now (gensym "NOW")))
    (multiple-value-bind (body decls docstring)
        (alexandria:parse-body body :documentation t)
      `(let ((,prev-time 0)
             (,prev-val "no link"))
         (defun ,name ,arglist
           ,@(when docstring
               (list docstring))
           ,@decls
           (let ((,now (get-internal-real-time)))
             (when (>= (- ,now ,prev-time)
                       (* ,interval internal-time-units-per-second))
               (setf ,prev-time ,now)
               (setf ,prev-val (progn ,@body)))
             ,prev-val))))))

(defun guess-wireless-device ()
  (or (loop
         for path in (list-directory "/sys/class/net/")
         thereis (let ((device-name (car (last (pathname-directory path)))))
                   (if (probe-file (merge-pathnames (make-pathname :directory '(:relative "wireless"))
                                                    path))
                       device-name
                       nil)))
      (error "No wireless device found.")))

(defun-cached fmt-wifi 5 (ml)
  "Formatter for wifi status. Displays the ESSID of the access point
you're connected to as well as the signal strength. When no valid data
is found, just displays nil."
  (declare (ignore ml))
  (block fmt-wifi
    (handler-case
        (let* ((device (or *wireless-device* (guess-wireless-device)))
               (iwconfig (run-shell-command (format nil "~A ~A 2>/dev/null"
                                                    *iwconfig-path*
                                                    device)
                                            t))
               (essid (multiple-value-bind (match? sub)
                          (cl-ppcre:scan-to-strings "ESSID:\"(.*)\"" iwconfig)
                        (if match?
                            (aref sub 0)
                            (return-from fmt-wifi "no link"))))
               (qual (multiple-value-bind (match? sub)
                         (cl-ppcre:scan-to-strings "Link Quality=(\\d+)/(\\d+)" iwconfig)
                       (declare (ignorable match?))
                       (truncate (float (* (/ (parse-integer (aref sub 0))
                                              (parse-integer (aref sub 1)))
                                           100))))))
          (format-expand *wifi-formatters-alist*
                         *wifi-modeline-fmt*
                         (cons essid qual)))
      ;; CLISP has annoying newlines in their error messages... Just
      ;; print a string showing our confusion.
      (t (c) (format nil "~A" c)))))

;;; Add mode-line formatter

(add-screen-mode-line-formatter #\I #'fmt-wifi)

