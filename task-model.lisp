(defpackage :task-model
  (:use :cl)
  (:export :make-task :task-name :task-priority :task-due-date))

(in-package :task-model)

(defstruct task
  name
  priority
  due-date)

(defun make-task (name priority due-date)
  "Create a new task with the given NAME, PRIORITY, and DUE-DATE."
  (make-task :name name :priority priority :due-date due-date))

(defun task-name (task)
  (task-name task))

(defun task-priority (task)
  (task-priority task))

(defun task-due-date (task)
  (task-due-date task))
