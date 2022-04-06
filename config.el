;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Alexis Praga"
      user-mail-address "alexis.praga@free.fr")

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.

;; Rest of the org config goes there
(after! org
  ;; My agenda files
  (setq org-agenda-files (list "~/org/todo.org"))
  ;; Important : agenda view does not show notes with imcomplete parents in Doom
  (setq org-agenda-start-day "today"
        org-refile-allow-creating-parent-nodes 'confirm)
  ;; Simpler templates. WARNING: property in templates makes doom crash
  ;; as it uses org-crypt. For now, org-crypt must be disabled in packages.el
  ;; See https://github.com/hlissner/doom-emacs/issues/6250
  (setq
        org-capture-templates
        '(("t" "Personal todo" entry
           (file+headline "~/org/todo.org" "Inbox")
           "* TODO %?\n%^{test}p" :prepend t :kill-buffer t))))

  ;; Bibliography with citar (vertico is the default completion engine)
(after! citar
  (setq! citar-bibliography '("~/org/recherche/wdr45/biblio.bib"))
  )
