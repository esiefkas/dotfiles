{;;; Modular profiles

 :cider {:dependencies [;; CIDER 0.13.0 requires Clojure 1.7.0+ and
                        ;; tools.nrepl 0.2.12+ to work. These are used
                        ;; by default, but projects might want to
                        ;; override them. If we're using CIDER though,
                        ;; we don't want to let them do that.
                        [org.clojure/clojure "1.9.0-alpha16"]
                        ;;[org.clojure/clojure "1.8.0"]
                        [org.clojure/tools.nrepl "0.2.12"]]

         :monkeypatch-clojure-test false

         :plugins [;; REPL-side support for CIDER and other editor tools
                   [cider/cider-nrepl "0.13.0"]]

         :injections [;; Make a tweak to the internal code used by compliment, the
                      ;; completion library used by cider-nrepl, to recognize which
                      ;; symbols could be vars. In particular, change the function
                      ;; to (constantly true) -- that is, *all* symbols could be
                      ;; vars. I haven't found any downsides to this (yet), and it
                      ;; fixes a problem with the regex used by default not
                      ;; recognizing vars in the '.' namespace.
                      ;;
                      ;; Needless to say, this is a hack.
                      (alter-var-root
                        #'cider.inlined-deps.compliment.v0v3v0.compliment.sources.ns-mappings/var-symbol?
                        (constantly (constantly true)))]}


 :awesome [:cider]}
