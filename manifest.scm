;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(specifications->manifest
 (list
  ;; Emacs and packages
  "emacs-next-pgtk"
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
  "emacs-haskell-mode"
  "emacs-icomplete-vertical"
  "emacs-keycast"
  "emacs-lsp-mode"
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
  "gcc-toolchain"
  "glibc"
  "chez-scheme"
  "racket"
  "sbcl"
  "ghc"
  "ocaml"
  "agda"
  "idris"
  "coq"
  "lean"
  ;"cedille"
  ;; Utils
  "alsa-utils"
  "aria2"
  "btrfs-progs"
  "curl"
  "dash"
  "exa"
  "fd"
  "ffmpegthumbnailer"
  "file"
  "file"
  "git"
  "gnupg"
  "gst-libav"
  "gst-plugins-base"
  "gst-plugins-good"
  "gstreamer"
  "htop"
  "openssh"
  "ripgrep"
  "rlwrap"
  "stow"
  "time"
  "tumbler"
  "xdo"
  "youtube-dl"
  ;; Web browsers
  "firefox"
  "nyxt"
  "qutebrowser"
  "ungoogled-chromium"
  ;; GUI programs
  "alacritty"
  "anki"
  "mpv"
  "transmission"
  "xarchiver"
  "xfce4-screenshooter"
  ))
