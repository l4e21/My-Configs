;; -*-lisp-*-
;;
;; To configure stumpwm


(in-package :stumpwm)



;; change the prefix key to something else
(run-shell-command "xmodmap -e 'clear mod4'")
(run-shell-command "xmodmap -e \'keycode 133 = F20\'")

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
;; (define-key *root-map* (kbd "b") "colon1 exec firefox http://www.")
;; Ssh somewhere
;; (define-key *root-map* (kbd "C-s") "colon1 exec xterm -e ssh ")
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
	    "%d"
	    "  [Signal: %I]"
	    "  [Life:^2 "
	    '(:eval (string-trim '(#\newline) (with-open-file (*standard-input* #p"/sys/class/power_supply/BAT0/capacity")(read-line))))
	    "%%^]]"
	    ))


(setf *mode-line-timeout* 1)

(toggle-mode-line (current-screen)
        (current-head))

(setf *window-format* "%m%n%s%c")

(setf *hidden-window-color* "^7")


(setf *wifi-modeline-fmt* "%p")




;; Background 
(run-shell-command "feh --bg-center $HOME/Pictures/justpretty/lainwallpaper.jpg")
(run-shell-command "discord")
;;(run-shell-command "hexchat")
;;(run-shell-command "spotify")
;;(run-shell-command "firefox")
(run-shell-command "guake")





;;Volume keys
;;Second three are in case ??? for some reason pulseaudio uses different sourcesx
(define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec pactl set-sink-volume @DEFAULT_SINK@ +5%")
(define-key *top-map* (kbd "XF86AudioLowerVolume") "exec pactl set-sink-volume @DEFAULT_SINK@ -5%")
(define-key *top-map* (kbd "XF86AudioMute") "exec pactl set-sink-mute @DEFAULT_SINK@ toggle")

    
;; Backlight control
(define-key *top-map* (kbd "XF86MonBrightnessUp") "exec xbacklight -inc 5")
(define-key *top-map* (kbd "XF86MonBrightnessDown") "exec xbacklight -dec 5")

;;Screenshooter
(define-key *top-map* (kbd "SunPrint_Screen") "exec xfce4-screenshooter")

;;Open appfinder
(define-key *top-map* (kbd "F20") "exec thunar")





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


