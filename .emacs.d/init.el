(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(dolist (package '(monokai-pro-theme evil yasnippet yaml-mode))
   (unless (package-installed-p package)
     (package-install package)))
; (add-to-list 'load-path "~/.emacs.d/packages")

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(xterm-mouse-mode 1)
(set-frame-font "Hasklug Nerd Font Mono 15" nil t)
(load-theme 'monokai-pro-spectrum t)

(require 'evil)
(evil-mode 1)

(require 'yasnippet)
(yas-global-mode 1)

(setq linum-format " %d")
(global-linum-mode 1)

(with-eval-after-load "ispell"
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "en_US,ru_RU")
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,ru_RU"))
(dolist (hook '(text-mode-hook latex-mode org-mode))
  (add-hook hook (lambda () (flyspell-mode 1) (flyspell-buffer))))

(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path. If the new path's
   directories does not exist, create them."
  (let* (
        (backupRootDir "~/.emacs.d/backup/")
        (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, for example, “C:”
        (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
        )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
  )
)

(setq make-backup-file-name-function 'my-backup-file-name)

(require 'yaml-mode)
(require 'json)
(require 'ox)
(setq org-image-actual-width nil)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.7))
(setq org-latex-create-formula-image-program 'dvipng)

