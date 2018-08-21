
(cl:in-package :asdf)

(defsystem "vision-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "Percept" :depends-on ("_package_Percept"))
    (:file "_package_Percept" :depends-on ("_package"))
  ))