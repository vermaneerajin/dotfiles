;;; package --- Summary
;;; Commentary:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(package-initialize)

(require 'package)

;; Adding melpa packages
(add-to-list 'package-archives
     '("melpa-stable" . "https://stable.melpa.org/packages/") t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (fill-column-indicator company markdown-mode org go-mode go-playground gorepl-mode gotest php-mode phpunit web-beautify web-mode helm-projectile robe rubocop ruby-compilation ruby-electric ggtags flycheck helm magit neotree projectile chess))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Emacs startup setup
(setq inhibit-startup-screen t) ;; Don't show emacs default startup screen
(tool-bar-mode 0) ;; Don't show toolbar
(menu-bar-mode 0) ;; Don't show menubar

;; Keep neotree open on every new emacs instance
(neotree-show)

;; Editor beauty
(global-linum-mode t) ;; Show line number
(global-whitespace-mode t) ;; Show whitespace characters
(global-hl-line-mode t) ;; Highlight current line
(require 'fill-column-indicator) ;; Show line margin
(show-paren-mode t) ;; Show matchin brackets
(setq whitespace-line 0) ;; Disable whitespace showing long line with different formatting

;; Development enhancements
(global-flycheck-mode t) ;; Check errors for language
(projectile-mode t) ;; Add project management support
(global-company-mode t) ;; Auto completion
(setq company-dabbrev-downcase nil) ;; Fix for company autocompletion downcase

;; Personal enhancements
(add-hook 'after-save-hook 'whitespace-cleanup) ;; Remove extra whitespace after saving files

;; Extra configurations

;; Enable web-mode for special files
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))

(provide '.emacs)
;;; .emacs ends here
