(uiop:define-package :tmx
  (:use :cl))

(uiop:define-package :%tmx
  (:use))


(claw:defwrapper (tmx::bodge-tmx
                  (:headers "tmx.h")
                  (:includes :tmx-includes)
                  (:include-definitions "tmx_\\w*"
                                        "^layer_content$"))
  :in-package :%tmx
  :trim-enum-prefix t
  :recognize-bitfields t
  :recognize-strings t
  :override-types ((:pointer claw-utils:claw-pointer))
  :symbolicate-names (:by-removing-prefixes "tmx_"))
