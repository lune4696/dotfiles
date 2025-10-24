;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; org-latex
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (load custom-file t)

;; Ignore windows key
(setq w32-rwindow-modifier nil
      w32-lwindow-modifier nil)

;; Character code setting for Windows
(when IS-WINDOWS
  (set-language-environment "Japanese")
  (set-coding-system-priority 'utf-8
                              'euc-jp
                              'iso-2022-jp
                              'cp932))
;; Show function name
(which-function-mode +1)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq vterm-shell "/usr/bin/zsh")

;; org mode の設定
;; ファイルの場所
(setq org-directory "~/Documents/org/")
;;(setq org-directory "~/Dropbox/Org")
(setq org-default-notes-file "notes.org")

;; Org-captureの設定

;; Org-captureを呼び出すキーシーケンス
(define-key global-map "\C-cc" 'org-capture)
;; Org-captureのテンプレート（メニュー）の設定
(setq org-capture-templates
      '(("n" "Note" entry (file+headline "~/Documents/org/notes.org" "Notes")
         "* %?\nEntered on %U\n %i\n %a")
        ))

;; メモをC-M-^一発で見るための設定
;; https://qiita.com/takaxp/items/0b717ad1d0488b74429d から拝借
(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat "~/Documents/org/" file))))

(global-set-key (kbd "\C-cs") '(lambda () (interactive)
                                 (show-org-buffer "notes.org")))

;; lispy の wrap を有効化
;; lispy の一部キーバインドを無効化
;; [] {} の lispy キーバインドを外す
;; [] が lispyville キーバインドから消えないので強制排除
(after! lispy
  (define-key lispy-mode-map (kbd "[") #'lispy-brackets)
  (define-key lispy-mode-map-evilcp (kbd "[") #'lispy-brackets)
  (define-key lispy-mode-map-lispy (kbd "[") #'lispy-brackets)
  (define-key lispy-mode-map (kbd "}") #'lispy-backward)
  (define-key lispy-mode-map-evilcp (kbd "}") #'lispy-backward)
  (define-key lispy-mode-map-lispy (kbd "}") #'lispy-backward)
  (map! :map lispy-mode-map
        :n "M-(" #'lispy-wrap-round
        :n "M-[" #'lispy-wrap-brackets
        :n "M-{" #'lispy-wrap-braces)
  )


(with-eval-after-load 'org
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(org-format-latex-header
     "\\documentclass{article}\12\\usepackage[usenames]{color}\12[DEFAULT-PACKAGES]\12[PACKAGES]\12[physics2]\12\\pagestyle{empty}\12% do not remove\12% The settings below are copied from fullpage.sty\12\\setlength{\\textwidth}{\\paperwidth}\12\\addtolength{\\textwidth}{-3cm}\12\\setlength{\\oddsidemargin}{1.5cm}\12\\addtolength{\\oddsidemargin}{-2.54cm}\12\\setlength{\\evensidemargin}{\\oddsidemargin}\12\\setlength{\\textheight}{\\paperheight}\12\\addtolength{\\textheight}{-\\headheight}\12\\addtolength{\\textheight}{-\\headsep}\12\\addtolength{\\textheight}{-\\footskip}\12\\addtolength{\\textheight}{-3cm}\12\\setlength{\\topmargin}{1.5cm}\12\\addtolength{\\topmargin}{-2.54cm}")
   '(org-format-latex-options
     '(:foreground default :background default :scale 0.625 :html-foreground "Black"
       :html-background "Transparent" :html-scale 1.0 :matchers
       ("begin" "$1" "$" "$$" "\\(" "\\[")))
   '(org-preview-latex-process-alist
     '((dvipng :programs ("latex" "dvipng") :description "dvi > png" :message
        "you need to install the programs: latex and dvipng." :image-input-type
        "dvi" :image-output-type "png" :image-size-adjust (1.0 . 1.0)
        :latex-compiler ("latex -interaction nonstopmode -output-directory %o %f")
        :image-converter ("dvipng -D %D -T tight -o %O %f")
        :transparent-image-converter
        ("dvipng -D %D -T tight -bg Transparent -o %O %f"))
       (dvisvgm :programs ("latex" "dvisvgm") :description "dvi > svg" :message
        "you need to install the programs: latex and dvisvgm." :image-input-type
        "dvi" :image-output-type "svg" :image-size-adjust (1.7 . 1.5)
        :latex-compiler ("latex -interaction nonstopmode -output-directory %o %f")
        :image-converter
        ("dvisvgm %f --no-fonts --exact-bbox --scale=%S --output=%O"))
       (imagemagick :programs ("latex" "convert") :description "pdf > png"
        :message "you need to install the programs: latex and imagemagick."
        :image-input-type "pdf" :image-output-type "png" :image-size-adjust
        (1.0 . 1.0) :latex-compiler
        ("/usr/bin/latex -interaction nonstopmode -output-directory %o %f")
        :image-converter
        ("/usr/bin/convert -density %D -trim -antialias %f -quality 100 %O")))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   ))

(setq org-preview-latex-default-process 'dvisvgm)

(use-package! claude-code-ide
  :bind ("C-c C-'" . claude-code-ide-menu) ; Set your favorite keybinding
  :config
  (claude-code-ide-emacs-tools-setup)) ; Optionally enable Emacs MCP tools
