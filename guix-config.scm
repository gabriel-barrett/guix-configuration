(use-modules (gnu)
             (gnu system nss)
             (guix packages)
             (gnu packages linux)
             (srfi srfi-1)
             (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules desktop virtualization ssh xorg)
(use-package-modules certs compression fonts gnome lisp ssh tmux vim web-browsers wm)

(define custom/xorg-config
  "Section \"InputClass\"
            Identifier \"system-mouse\"
                MatchIsPointer \"on\"
                    Option \"ScrollMethod\" \"button\"
                        Option \"ScrollButton\" \"12\"
                        EndSection\n")

(operating-system
 (kernel linux)
 (initrd microcode-initrd)
 (kernel-arguments '("modprobe.blacklist=b43,b43legacy,ssb,bcm43xx,brcm80211,brcmfmac,brcmsmac,bcma"))
 (kernel-loadable-modules (list broadcom-sta))
 (firmware (list linux-firmware))

 (host-name "guix-box")
 (timezone "America/Bahia")
 (locale "en_US.utf8")

 ;; Boot in "legacy" BIOS mode, assuming /dev/sdX is the
 ;; target hard disk, and "my-root" is the label of the target
 ;; root file system.
 (bootloader (bootloader-configuration
              (bootloader grub-efi-bootloader)
              (targets '("/efi"))))

 (file-systems (cons*
                (file-system
                 (device (file-system-label "guix"))
                 (mount-point "/")
                 (type "btrfs"))
                (file-system
                 (device (file-system-label "home"))
                 (mount-point "/home")
                 (type "btrfs"))
                (file-system
                 (device (file-system-label "EFI"))
                 (mount-point "/efi")
                 (type "vfat"))
                %base-file-systems))

 (groups (cons* (user-group (name "develop"))
                %base-groups))

 ;; This is where user accounts are specified.  The "root"
 ;; account is implicit, and is initially created with the
 ;; empty password.
 (users (cons* (user-account
                (name "guix-user")
                (group "users")

                ;; Adding the account to the "wheel" group
                ;; makes it a sudoer.  Adding it to "audio"
                ;; and "video" allows the user to play sound
                ;; and access the webcam.
                (supplementary-groups '("wheel" "audio" "video")))
               (user-account
                (name "develop")
                (group "develop"))
               %base-user-accounts))

 ;; Globally-installed packages.
 (packages (cons*
            ;; Window manager
            sbcl
            stumpwm
            (list stumpwm "lib")
            sbcl-stumpwm-ttf-fonts
            font-dejavu
            ;; Multiplexer, browser and editor
            tmux
            lynx
            vim
            ;; For HHTPS access
            nss-certs
            ;; For user mounts
            gvfs
            %base-packages))

 ;; Add services to the baseline
 (services (cons*
            (service xfce-desktop-service-type)
            (service gnome-desktop-service-type)
            (service openssh-service-type
                     (openssh-configuration
                      (openssh openssh-sans-x)
                      (port-number 80)
                      (permit-root-login #f)
                      (allow-empty-passwords? #f)
                      (password-authentication? #f)
                      (extra-content "AllowUsers    develop")))
            (service libvirt-service-type
                     (libvirt-configuration
                      (unix-sock-group "libvirt")
                      (tls-port "16555")))
            (set-xorg-configuration
             (xorg-configuration
              (extra-config (list custom/xorg-config))))
            %desktop-services))

 ;; Allow resolution of '.local' host names with mDNS.
 (name-service-switch %mdns-host-lookup-nss))
