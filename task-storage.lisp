(defpackage :task-storage
  (:use :cl :task-model)
  (:export :save-tasks :load-tasks))

(in-package :task-storage)

(defun save-tasks (tasks file-path)
  "Save a list of TASKS to a file at FILE-PATH."
  (with-open-file (stream file-path :direction :output :if-exists :supersede)
    (dolist (task tasks)
      (write task :stream stream :pretty t))))

(defun load-tasks (file-path)
  "Load tasks from FILE-PATH and return a list of task objects."
  (let ((tasks '()))
    (with-open-file (stream file-path :direction :input :if-does-not-exist nil)
      (loop for task = (read stream nil nil)
            while task do
              (push task tasks)))
    tasks))
