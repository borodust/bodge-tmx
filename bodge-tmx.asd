(asdf:defsystem :bodge-tmx
  :description "Wrapper over libtmx"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (:alexandria :cffi :cffi-c-ref :claw :claw-utils)
  :serial t
  :pathname "src/"
  :components ((:file "claw")
               (:module :spec)
               (:module :tmx-lib :pathname "lib/tmx/")
               (:module :tmx-includes :pathname "lib/tmx/src/")))
