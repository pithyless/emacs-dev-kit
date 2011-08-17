;; ruby-mode settings
(global-set-key (kbd "C-h r") 'ri)

;; delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")

(require 'yari)

(add-hook 'ruby-mode-hook
          '(lambda ()
             (coding-hook)
             (inf-ruby-keys)
             (local-set-key [f1] 'yari)))

(require 'haml-mode)
(require 'scss-mode)

;; Ruby ERB
(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))
(require 'rhtml-mode)

;; Textmate
(require 'textmate)
(require 'peepopen)
(defun is-rails-project ()
  (when (textmate-project-root)
    (file-exists-p (expand-file-name "config/environment.rb" (textmate-project-root)))))
(defun peepopen-bind-ns-keys ()
  (define-key *textmate-mode-map* [(meta o)] 'peepopen-goto-file-gui))
(textmate-mode)
(setq ns-pop-up-frames nil)

(provide 'ruby-config)
