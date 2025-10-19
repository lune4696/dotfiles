(put 'customize-variable 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-format-latex-header
   "\\documentclass{article}\12\\usepackage[usenames]{color}\12[DEFAULT-PACKAGES]\12[PACKAGES]\12\\usepackage{physics2}\12\\pagestyle{empty}             % do not remove\12% The settings below are copied from fullpage.sty\12\\setlength{\\textwidth}{\\paperwidth}\12\\addtolength{\\textwidth}{-3cm}\12\\setlength{\\oddsidemargin}{1.5cm}\12\\addtolength{\\oddsidemargin}{-2.54cm}\12\\setlength{\\evensidemargin}{\\oddsidemargin}\12\\setlength{\\textheight}{\\paperheight}\12\\addtolength{\\textheight}{-\\headheight}\12\\addtolength{\\textheight}{-\\headsep}\12\\addtolength{\\textheight}{-\\footskip}\12\\addtolength{\\textheight}{-3cm}\12\\setlength{\\topmargin}{1.5cm}\12\\addtolength{\\topmargin}{-2.54cm}")
 '(org-format-latex-options
   '(:foreground default :background default :scale 0.8 :html-foreground "Black"
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
 )
