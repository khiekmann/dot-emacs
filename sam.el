;; Pull in all shared init stuff
(load-file "~/.emacs.d/config/core.el")

;;Colour theme
(load-file "~/.emacs.d/vendor/blackbored.el")
(load-file "~/.emacs.d/vendor/whitebored.el")
(color-theme-whitebored)
(color-theme-blackbored)

;;Fonts
;;to set the font:
;;M-x mac-font-panel-mode
;;M-x describe-font
;;for NS emacs 23
(set-face-font 'default "-apple-Menlo-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")
;;
;;for Carbon emacs 22
;;(set-face-font 'default "-apple-menlo-medium-r-normal--10-100-72-72-m-100-iso10646-1")

(setq mac-command-modifier 'meta)

(setq exec-path (append exec-path '("/usr/local/git/bin/git")))
(push "/Applications/SuperCollider" exec-path)

(setq path "/Users/sam/.rvm/bin:/Applications/SuperCollider:/Applications/Emacs.app/Contents/MacOS/bin:/Users/sam/bin:/usr/local/bin:$PATH:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin/:/usr/local/ruby1.9/bin:/Users/sam/Development/jruby/bin:/Users/sam/Development/chuck/bin:/Users/sam/Development/ioke/bin:~/innovationfactory/suite/dev/if-scripts:/bin")
(setenv "PATH" path)

(push "/usr/local/bin" exec-path)
(push "/Users/sam/.rvm/bin" exec-path)

;;org mode config
;(load-file "~/.emacs.d/org-mode-config.el")

;organise ibuffer into handy groups
(setq ibuffer-saved-filter-groups
          (quote (("default"
                   ("IRC"      (mode . erc-mode))
                                      ("emacs" (or
                             (name . "^\\*scratch\\*$")
                             (name . "^\\*Messages\\*$")
                             (name . "^\\*Completions\\*$")
                             (filename . ".emacs.d")))

                   ("practice" (filename . "Development/practice/apps"))
                   ("apps"      (filename . "Development/improcess/apps"))
                   ("improcess"      (filename . "Development/improcess/"))
                   ("dired" (mode . dired-mode))
                   ("supercollider" (or
                                     (mode . SCLang)
                                     (mode . SCLangHelp)))
                   ))))
    (add-hook 'ibuffer-mode-hook
              (lambda ()
                (ibuffer-switch-to-saved-filter-groups "default")))

;projects
 (project-def "polynome"
       '((basedir          "/Users/sam/Development/polynome")
         (src-patterns     ("*.rb"))
         (ignore-patterns  ("*.rbc" "*.log"))
         (vcs              git)
         (ack-args         "--ruby")
        (shutdown-hook    nil)))


;;highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#333333")

;cursor
(set-cursor-color "yellow")

;make mark colour a nice usable dark pink
(set-face-background 'region "#7F073F")

(require 'erc-join)
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "#clojure" "#clojure-casual")
        ("irc.goto10.org" "#openlab")))


;;(erc :server "irc.freenode.net" :full-name "Sam Aaron" :port 6667 :nick "naeu")
;;(erc :server "irc.goto10.org"   :full-name "Sam Aaron" :port 6667 :nick "naeu")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;stuff I tried out and either couldn't get to work or didn't like, but might try again;;
;;ECB
;(add-path "vendor/ecb-2.40")
;(require 'ecb)

;;CEDET mode
;(load-file "~/.emacs.d/vendor/cedet-1.0pre6/common/cedet.el")
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;(global-srecode-minor-mode 1)            ; Enable template insertion menu

; enable skeleton-pair insert globally
;(setq skeleton-pair t)
;(setq skeleton-pair-on-word t) ; apply skeleton trick even in front of a word.
;(global-set-key (kbd "(")  'skeleton-pair-insert-maybe)
;(global-set-key (kbd "[")  'skeleton-pair-insert-maybe)
;(global-set-key (kbd "{")  'skeleton-pair-insert-maybe)
;(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
;(global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)

;;on os x use command key as meta
;(setq mac-option-modifier 'nil)
