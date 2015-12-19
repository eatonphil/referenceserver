(require 'sb-bsd-sockets)

(defun make-listen-socket ()
  (let ((sock (make-instance 'sb-bsd-sockets:inet-socket
			     :protocol :tcp :type :stream)))
    (setf (sb-bsd-sockets:sockopt-reuse-address sock) t)
    (sb-bsd-sockets:socket-bind sock #(127 0 0 1) 15000)
    (sb-bsd-sockets:socket-listen sock -1)
    sock))

(defun accept-one (c)
  (unwind-protect
       (let ((stream (sb-bsd-sockets:socket-make-stream c :output t)))
	 (format stream "Hello world~&"))
    (sb-bsd-sockets:socket-close c)))

(defun serve (l)
  (let ((c (sb-bsd-sockets:socket-accept l)))
    (sb-thread:make-thread (lambda () (accept-one c))))
  (serve l))

(defun main ()
  (let ((l (make-listen-socket)))
    (unwind-protect
	 (serve l)
      (sb-bsd-sockets:socket-close l))))
