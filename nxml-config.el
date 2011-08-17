;; Use nxml-mode instead of sgml, xml or html mode.
(mapc
 (lambda (pair)
   (if (or (eq (cdr pair) 'xml-mode)
           (eq (cdr pair) 'sgml-mode)
           (eq (cdr pair) 'html-mode))
       (setcdr pair 'nxml-mode)))
 auto-mode-alist)

(push '("<\\?xml" . nxml-mode) magic-mode-alist)

;; pom files should be treated as xml files
(add-to-list 'auto-mode-alist '("\\.pom$"   . nxml-mode))

(setq nxml-child-indent 2)
(setq nxml-attribute-indent 4)
(setq nxml-auto-insert-xml-declaration-flag nil)
(setq nxml-bind-meta-tab-to-complete-flag t)
(setq nxml-slash-auto-complete-flag t)
(setq rng-nxml-auto-validate-flag nil)

(eval-after-load 'nxml-mode
  '(add-hook 'nxml-mode-hook
             (lambda ()
               (local-set-key (kbd "M-RET") 'nxml-finish-element))))

(provide 'nxml-config)
