(defpackage :task-manager
  (:use :cl :task-model :task-storage)
  (:export :add-task :view-tasks :delete-task :edit-task))

(in-package :task-manager)

(defvar *tasks* ())

(defun add-task (name priority due-date)
  "Add a new task to the task list."
  (let ((task (make-task name priority due-date)))
    (push task *tasks*)))

(defun view-tasks ()
  "Display all tasks with details."
  (format t "Current Tasks:~%")
  (dolist (task *tasks*)
    (format t "~%Name: ~a, Priority: ~a, Due Date: ~a~%" 
            (task-name task) 
            (task-priority task) 
            (task-due-date task))))

(defun delete-task (name)
  "Delete a task by its NAME."
  (setf *tasks* (remove-if (lambda (task) (string= name (task-name task))) *tasks*))
  (format t "Task '~a' deleted.~%" name))

(defun edit-task (name new-name new-priority new-due-date)
  "Edit an existing task."
  (let ((task (find-if (lambda (task) (string= name (task-name task))) *tasks*)))
    (when task
      (setf (task-name task) new-name
            (task-priority task) new-priority
            (task-due-date task) new-due-date)
      (format t "Task '~a' updated.~%" new-name))))
