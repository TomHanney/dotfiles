;; Copy these lines to .emacs to import customisation
					;(add-to-list 'load-path "~/Dev/Emacs")
					;(setq dev-root "/home/tom/Dev")
					;(load-file "~/Dev/Emacs/dotemacs.el")

;; Set the directory this file lives in
;; Want all load paths to be set relative to this
(defconst custom-path (file-name-directory load-file-name))
(message (concat "Customisation path: " custom-path))

(defun custom-dir (path)
  (concat custom-path path))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Remember, can play with functions in *scratch* via things like
;; (set-frame-width (selected-frame) 100)  ;; ^J to execute.

;;
;; Emacs customisation
;;

(message "Disabling auto-save")
(setq auto-save-default nil)

(message "Disabling backup files")
(setq make-backup-files nil)

(message "Setting line numbers/display")
(global-linum-mode t)
(setq line-number-mode t)
(setq column-number-mode t)

(message "Set frame size")
(set-frame-size (selected-frame) 90 60)
					;(split-window-vertically)
;; Want to set defaults eventually...:
;; (add-to-list 'default-frame-alist '(width . 80))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "Adding shortcuts")

;; Replicate eclipse shortcut for quick comment line
(message "Add eclipse shortcut to comment 80 char line: C-f4 -> 80 #")
(global-set-key (kbd "C-<f4>") (kbd "C-u 80 #"))

;; Shortcut to toggle comment/uncomment for region, or current line if 
;; no region is selected regardless of point location within the line
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(message "Bind comment/uncomment toggle to C-c C-c")
(global-set-key "\C-c\C-c" 'comment-or-uncomment-region-or-line)

;; Shortcut to duplicate the current line
(defun duplicate-line ()
  "Duplicates the current line"
  (interactive)
  (beginning-of-line)
  (kill-line)
  (yank)
  (newline)
  (yank))

(message "Bind duplicate line to C-D")
(global-set-key (kbd "C-S-d") 'duplicate-line)

;; Shortcut to create new line on line before point, wherever point is on 
;; the current line
(defun new-line-before ()
  "Move point to beginning of new line before current line"
  (interactive)
  (previous-line)
  (end-of-line)
  (newline-and-indent))

(message "Bind insert new line before to C-O")
(global-set-key (kbd "C-S-o") 'new-line-before)

;; Shortcut to create new line on line after point, wherever point is on 
;; the current line
(defun new-line-after ()
  "Move point to beginning of new line after current line"
  (interactive)
  (end-of-line)
  (newline-and-indent))

(message "Bind insert new line after to C-o")
(global-set-key "\C-o" 'new-line-after)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; Python env
;;

;; Set python specific environment (e.g. python path) via script, rather
;; than in emacs directly. Trying to divorce the python env from the editor...
;; REMOVED: just want vanilla setup for now - restore later if I miss it
;; All this does is set up python path env. Would like to do this independently
;; of dev file structure (e.g. need dev-root to have been set prior to 
;; execution of this file... don't like this.
;; (message "Loading python environment")
;; (shell-command (concat dev-root "/Python/python-env.sh"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; Third party bits and bats
;;

;; Improved scrolling
(message "Loading pager...")
(add-to-list 'load-path (custom-dir "pager"))
(require 'pager)
;; (global-set-key "\C-v"	   'pager-page-down)
;; (global-set-key [next] 	   'pager-page-down)
;; (global-set-key "\ev"	   'pager-page-up)
;; (global-set-key [prior]	   'pager-page-up)
;; (global-set-key '[M-up]    'pager-row-up)
;; (global-set-key '[M-p]  'pager-row-up)
;; (global-set-key '[M-down]  'pager-row-down)
;; (global-set-key '[M-n]  'pager-row-down)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
