(define-module (daviwil systems zerocool)
  #:use-module (daviwil systems base)
  #:use-module (gnu))

(operating-system
 (inherit base-operating-system)
 (host-name "zerocool")

 (mapped-devices
  (list (mapped-device
         (source (uuid "039d3ff8-0f90-40bf-89d2-4b2454ada6df"))
         (targets "system-root")
         (type luks-device-mapping))))

 (file-systems (cons*
                (file-system
                 (device (file-system-label "zerocool"))
                 (mount-point "/")
                 (type "ext4")
                 (dependencies mapped-devices))
                (file-system
                 (device "/dev/nvme0n1p1")
                 (mount-point "/boot/efi")
                 (type "vfat"))
                %base-file-systems)))
