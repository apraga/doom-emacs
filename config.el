;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; General config
(setq user-full-name "Alexis Praga"
      user-mail-address "alexis.praga@free.fr"
      doom-theme 'doom-one)

;; Editor setup
(setq display-line-numbers-type 'relative)

;; Org config
(setq org-directory "~/org/") ; Must be set before org loads
(after! org
  (setq org-agenda-files (list "todo.org" "recherche.org") ; My agenda files
        org-agenda-start-day "today" ; Agenda view does not show notes with imcomplete parents in Doom !
        org-refile-allow-creating-parent-nodes 'confirm)
  ;; Simpler templates. WARNING: property in templates makes doom crash
  ;; as it uses org-crypt. For now, org-crypt must be disabled in packages.el
  ;; See https://github.com/hlissner/doom-emacs/issues/6250
  (setq org-capture-templates
        '(("t" "Personal todo" entry (file+headline "todo.org" "Inbox") "* TODO %?")
          ("s" "Sport")
          ("sr" "Running" entry (file "workout.org") "* %t Running\n%?" )
          ("st" "Tricking" entry (file "workout.org") "* %t Tricking\n%?")
          ("sw" "Workout" entry (file "workout.org") "* %t Workout\n%?")
          ))
  (with-eval-after-load "ox-latex"
    (add-to-list 'org-latex-classes
               '("scrreprt" "\\documentclass{scrreprt}"
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}"))))

  )
;; Bibliography with citar (vertico is the default completion engine)
(after! citar
  (setq! citar-bibliography '("~/org/recherche/wdr45/memoire.bib"))
  )
