(in-package :next-user)

(defclass my-remote-interface (remote-interface)
  ((search-engines :initform
    '(("default"
       "https://duckduckgo.com/?q=~a"
       "https://duckduckgo.com/")
      ("yt"
       "https://www.youtube.com/results?search_query=~a"
       "https://www.youtube.com/")
      ("wiki"
       "https://en.wikipedia.org/w/index.php?search=~a"
       "https://en.wikipedia.org/")
      ("sw"
       "https://swisscows.com/search=~a")
       ))))

(setf *remote-interface-class* 'my-remote-interface)


(defclass my-browser ()
  ((start-page-url :initform "about:blank")))

(setf *browser-class* 'my-browser)
