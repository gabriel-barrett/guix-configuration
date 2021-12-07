;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(specifications->manifest
 (list
  ;; Emacs and packages
  "emacs"
  "emacs-agda2-mode"
  "emacs-daemons"
  "emacs-evil"
  "emacs-evil-collection"
  "emacs-evil-leader"
  "emacs-evil-surround"
  "emacs-geiser"
  "emacs-geiser-chez"
  "emacs-geiser-guile"
  "emacs-geiser-racket"
  "emacs-guix"
  "emacs-icomplete-vertical"
  "emacs-haskell-mode"
  "emacs-lsp-mode"
  "emacs-keycast"
  "emacs-magit"
  "emacs-rust-mode"
  "emacs-slime"
  "emacs-sml-mode"
  "emacs-spacemacs-theme"
  "emacs-undo-tree"
  "emacs-which-key"
  ;; Fonts
  "font-adobe-source-han-sans:cn"
  "font-adobe-source-han-sans:jp"
  "font-adobe-source-han-sans:kr"
  "font-adobe-source-han-sans:tw"
  "fontconfig"
  ;; Languages
  "chez-scheme"
  "racket-minimal"
  "sbcl"
  "ghc"
  "ocaml"
  "agda"
  "coq"
  "lean"
  "idris"
  ;"cedille"
  ;; Utils
  "git"
  "dash"
  "htop"
  "fd"
  "file"
  "exa"
  "ripgrep"
  "rlwrap"
  "youtube-dl"
  "aria2"
  "stow"
  "xdo"
  "btrfs-progs"
  ;; Web browsers
  "nyxt"
  "qutebrowser"
  "ungoogled-chromium"
  ;; GUI programs
  "anki"
  "mpv"
  "alacritty"
  ))
