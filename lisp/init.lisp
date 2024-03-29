;; (in-package :stumpwm)
(set-module-dir "~/.stumpwm.d/modules")
;; (load-module "cl-shell")
;; (use-package 'cl-shell)
;; (load-module "stump-radio")
(load-module "swm-gaps")
(require 'swank)
(require 'bt-semaphore)


;; Debugging
;;

;; Make stumpm handle errors better
(add-hook *top-level-error-hook* (lambda ()
				   (quit)))

(setf stumpwm:*top-level-error-action* :break)



;; ;; Use this command and follow the instructions to live-edit Stump
(defcommand swank-start () ()
  (swank:create-server :port 4005
                       :style swank:*communication-style*
                       :dont-close t)
  (echo-string (current-screen) 
	       "Starting swank. M-x slime-connect RET RET, then (in-package stumpwm)."))

(swank-start)                           ;Requires multithreading to be active

;;
;; Shell setup
;; 


;;
;; Prefix and modmaps
;;

(run-shell-command "xmodmap -e 'clear mod4'")
(run-shell-command "xmodmap -e 'keycode 133 = Super_L'")
(run-shell-command "xmodmap -e 'add mod4 = Super_L'")

(set-prefix-key (kbd "C-a"))



;;
;; prompt the user for an interactive command
;;

(defcommand colon1 (&optional (initial "")) (:rest)
  (let ((cmd (read-one-line (current-screen) ": " :initial-input initial)))
    (when cmd
      (eval-command cmd t))))



;;
;; Define window placement policy...
;;

;; Clear rules
(clear-window-placement-rules)
;; Last rule to match takes precedence!




;; Groups, Windows, and Workspaces


;; Returns the number of windows in a group
(defun windownum ()
  (length (group-windows (current-group)))) 

;; Create groups
(defcommand create-groups () ()
  (loop for group in '("emacs" "soc" "slack" "misc")
	do
	   (gnewbg group)))


(grename "www")
(create-groups)
(gnewbg-float "float")
;; New navigation keys

(defmacro defset-key-selector (name map pref com suflist)
  ;; Suffix must be the same as command modifier, would like to fix this.
  `(defcommand ,name () ()
     (loop for x in ,suflist
	   do (define-key ,map (kbd (format nil "~a~a" ,pref x)) (format nil "~a ~a" ,com x)))))

;; Group selection and movement
(defset-key-selector gselect-keys *root-map* "" 'gselect '(1 2 3 4 5 6 7))
(defset-key-selector gmove-keys *root-map* "s-" 'gmove '(1 2 3 4 5 6 7))

;; Switch to window
(defset-key-selector selectwindow-keys *top-map* "s-" 'select-window-by-number '(1 2 3 4 5 6 7 8 9 0))

;; Focus keys and switching windows between frames
(defset-key-selector movefocus-keys *top-map* "s-" 'move-focus '("Left" "Right" "Up" "Down"))
(define-key *top-map* (kbd "s-h") "move-focus Left")
(define-key *top-map* (kbd "s-j") "move-focus Down")
(define-key *top-map* (kbd "s-k") "move-focus Up")
(define-key *top-map* (kbd "s-l") "move-focus Right")
(defset-key-selector exchange-keys *top-map* "s-S-" 'exchange-direction '("Left" "Right" "Up" "Down"))
(define-key *top-map* (kbd "s-S-h") "exchange-direction Left")
(define-key *top-map* (kbd "s-S-j") "exchange-direction Down")
(define-key *top-map* (kbd "s-S-k") "exchange-direction Up")
(define-key *top-map* (kbd "s-S-l") "exchange-direction Right")

;; Next and previous for windows and groups
(define-key *top-map* (kbd "s-n") "gnext")
(define-key *top-map* (kbd "s-p") "gprev")
(define-key *root-map* (kbd "n") "next")
(define-key *root-map* (kbd "p") "prev")

(define-key *root-map* (kbd "f") "fullscreen")

(gselect-keys)
(gmove-keys)
(selectwindow-keys)
(movefocus-keys)
(exchange-keys)

;; Only keybinding
(define-key *top-map* (kbd "s-q") "only")

;; MonadTall layout
(defcommand monadtall () ()
  (only)
  (when (> (- (windownum) 1) 0)
    (hsplit "1/2")
    (move-focus :right)
    (labels ((sortinglambda (windowleft)
	       (when (> (- windowleft 2) 0)
		 (vsplit (format nil "1/~a" (- windowleft 1)))
		 (move-focus :down)
		 (sortinglambda (- windowleft 1)))))
      (sortinglambda (windownum)))))


(define-key *top-map* (kbd "s-m") "monadtall")

;; Fibonacci layout
(defcommand spiral-splitter () ()
  (only)
  (labels ((iter1 ()
	     (hsplit "600/1000")
	     (move-focus :right))
	   (iter2 ()
	     (iter1)
	     (vsplit "600/1000")
	     (move-focus :down))
	   (iter3 ()
	     (iter2)
	     (hsplit "400/1000"))
	   (iter4 ()
	     (iter3)
	     (vsplit "400/1000"))
	   (sortinglambda (windowleft)
	     (if (> windowleft 3)
		 (progn
		   (iter4)
		   (sortinglambda (- windowleft 4)))
		 (unless (= windowleft 0)
		   (let ((remainder (mod windowleft 4)))
		     (case remainder
		       (1
			(iter1))
		       (2
			(iter2))
		       (3
			(iter3))
		       (0
			nil)))))))
    (sortinglambda (- (windownum) 1))))


(define-key *top-map* (kbd "s-SPC") "spiral-splitter")

;; Equality layout
(defun numcols (win_num)
  (multiple-value-bind (c l) (round (sqrt win_num))
    (cond ((and (<  l 0.5) (> l 0.01))
	   (+ 1 c))
	  (t c))))

;; If we can add another column to make things neater, we ought to!
(defun addifp (win_num)
  (let ((numcolplus (+ 1 (numcols win_num))))
    (if (= 0 (mod win_num numcolplus))
	numcolplus
	(numcols win_num))))

;; Basic number of rows
(defun numrowsnorm (win_num)
  (multiple-value-bind (r l) (floor win_num (addifp win_num))
    r))

;; Leftover rows
(defun lastcol-rows (win_num)
  (let ((basicamount (* (numrowsnorm win_num) (addifp win_num))))
    (+ (- win_num basicamount) (numrowsnorm win_num)))) 

;; The command
(defcommand equalityplane () ()
  (only)
  (labels ((splitrows (acc)
	     (when (> acc 1)
		 (vsplit (format nil "1/~a" acc))
		 (move-focus :down)
		 (splitrows (- acc 1))))
	   (splitcols (acc1 acc2) 
	     (when (> acc1 1)
	       (hsplit (format nil "1/~a" acc1))
	       (splitrows acc2)
	       (move-focus :right)
	       (splitcols (- acc1 1) acc2)))
	   )
    (splitcols (addifp (windownum)) (numrowsnorm (windownum)))
    (splitrows (lastcol-rows (windownum)))))

(define-key *top-map* (kbd "s-,") "equalityplane")


;; Triple-split horizontally
;; Nice to easily split into 3 panes

(defcommand triple-split () ()
  (only)
  (hsplit "1/3")
  (move-focus :right)
  (hsplit "1/2"))

(define-key *top-map* (kbd "s-.") "triple-split")

;;
;; Volume
;;

;;For the modeline

(defun getvolume ()
  (run-shell-command "amixer get Master | grep 'Front Left' | awk -F'[][]' '{ print $2 }'" t))

(defun mutedp ()
  (let ((command (run-shell-command "amixer get Master | grep 'Front Left' | awk -F '[][]' '{ print $4 }'" t)))
    (subseq command 1 (1- (length command)))))

(defun maybemute (mutedp)
  (if (string= mutedp "off")
      "m"
      ""))


;;Volume keys (default sink because pulse is dumb and changes default sink if you toggle it too much

(define-key *top-map* (kbd "F6") "exec pactl set-sink-volume @DEFAULT_SINK@ +5%")
(define-key *top-map* (kbd "F5") "exec pactl set-sink-volume @DEFAULT_SINK@ -5%")
(define-key *top-map* (kbd "F3") "exec pactl set-sink-mute @DEFAULT_SINK@ toggle")



;;
;; Battery
;;

;; Modeline formatting
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

;;
;; Random Quotes
;;

(defun random-of (xs)
  (nth (random (length xs)) xs))

;;
;; Format the modeline
;;

;; (setf *mode-line-foreground-color* "#33bb5e")
(setf *mode-line-foreground-color* "#FFFFFF")
(setf *mode-line-background-color* "#444444")
;; (setf *mode-line-background-color* "#101010")

(setf *screen-mode-line-format*
      (list "|| %g || %v || "
            " "
            "^>"
	    "%d  "
	    "[Vol: " 
	    '(:eval (string-trim '(#\newline) (getvolume)))
	    '(:eval (string-trim '(#\newline) (maybemute (mutedp))))
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



;;
;;Message & Input Bar
;;

;; (set-fg-color "#33bub5e")
(set-fg-color "#FFFFFF")
(set-bg-color "#444444")
(set-border-color "#444444")
(set-win-bg-color "#21252b")
(set-focus-color "#FFFFFF")
(set-unfocus-color "#444444")
(setf *maxsize-border-width* 1)
(setf *transient-border-width* 2)
(setf *normal-border-width* 5)
(set-msg-border-width 6)
(setf *window-border-style* :thin)
(setf *message-window-gravity* :bottom-right)
(setf *message-window-input-gravity* :bottom-right)
(setf *input-window-gravity* :bottom-right)



;;
;; Gaps
;;

;; Head gaps run along the 4 borders of the monitor(s)
(setf swm-gaps:*head-gaps-size* 0)

;; Inner gaps run along all the 4 borders of a window
(setf swm-gaps:*inner-gaps-size* 15)

;; Outer gaps add more padding to the outermost borders of a window (touching
;; the screen border)
(setf swm-gaps:*outer-gaps-size* 20)

(swm-gaps:toggle-gaps-off)



;;
;; Compositor
;;


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

(run-shell-command "picom &")



;;
;; Mouse 
;;

(setf *mouse-focus-policy* :click)

(defun follow-focus (current-frame prev-frame)
  (declare (ignore prev-frame))
  (let* ((screen (current-screen))
         (display (xlib:drawable-display (xlib:screen-root (screen-number screen))))
         (width (frame-width current-frame))
         (height (frame-height current-frame))
         (x (frame-x current-frame))
         (y (frame-y current-frame))
         (mouse-x (+ (/ width 2) x))
         (mouse-y (+ (/ height 2) y)))
    (multiple-value-bind (global-x global-y) (xlib:global-pointer-position display)
      (unless (and (< x global-x (+ x width))
                   (< y global-y (+ y height)))
        (ratwarp mouse-x mouse-y)))))

(add-hook *focus-frame-hook* #'follow-focus)

(run-shell-command "xinput --set-prop 11 338 0.9")
(run-shell-command "xinput --set-prop 12 337 0")

;;
;; Misc Key Definitions
;;
    
;; Backlight controls
(define-key *top-map* (kbd "F9") "exec xbacklight -inc 5")
(define-key *top-map* (kbd "F8") "exec xbacklight -dec 5")

;; Screenshooter
(define-key *top-map* (kbd "SunPrint_Screen") "exec xfce4-screenshooter")

;;Super based shortcuts for specific applications
(define-key *top-map* (kbd "s-t") "exec dolphin") 
(define-key *top-map* (kbd "s-f") "exec firefox")
(define-key *top-map* (kbd "s-d") "exec discord")
(define-key *top-map* (kbd "s-S-n") "exec nyxt")
(define-key *top-map* (kbd "s-e") "exec emacsclient -c -e \"(shell)\"")
(define-key *root-map* (kbd "e") "eval (run-or-raise \"emacs\" '(:class \"Emacs\"))")

;; Some essentials
;; (define-key *top-map* (kbd "C-RET") "exec xfce4-terminal")
(define-key *top-map* (kbd "s-RET") "exec alacritty")
;; (define-key *top-map* (kbd "C-k") "delete")
(define-key *top-map* (kbd "s-x") "delete")

;; Reload stump

(define-key *root-map* (kbd "M-r") "restart-hard")
(define-key *top-map* (kbd "s-r") "restart-hard")

(define-key *root-map* (kbd "C-s") "swank-start")

(define-key *root-map* (kbd "d") "exec")
;;
;; Window Preferences
;;

(define-frame-preference "teams"
    (0 t t :class "teams"))

(define-frame-preference "dev"
    (0 t t :class "pycharm"))

(define-frame-preference "games"
  (0 t t :class "Steam"))



;;
;; To run on startup
;;

(setf *random-state* (make-random-state t))
(run-shell-command (format nil "feh --bg-scale Pictures/wallpapers/gondla.png"))
(run-shell-command "dunst")
(run-shell-command "emacs")
(gmove 5)

;;
;; package updates
;; 

