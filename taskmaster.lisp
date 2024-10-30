(defpackage :taskmaster
  (:use :cl :task-manager :task-storage)
  (:export :main))

(in-package :taskmaster)

(defun display-menu ()
  "Display the main menu options."
  (format t "~%TaskMaster - Task Management CLI~%")
  (format t "1. Add Task~%")
  (format t "2. View Tasks~%")
  (format t "3. Delete Task~%")
  (format t "4. Edit Task~%")
  (format t "5. Save Tasks~%")
  (format t "6. Load Tasks~%")
  (format t "7. Exit~%"))

(defun main ()
  "Main entry point for TaskMaster CLI."
  (loop
   (display-menu)
   (let ((choice (read)))
     (case choice
       (1 (progn
            (format t "Enter task name: ")
            (let ((name (read-line)))
              (format t "Enter priority (low, medium, high): ")
              (let ((priority (read-line)))
                (format t "Enter due date: ")
                (let ((due-date (read-line)))
                  (add-task name priority due-date)
                  (format t "Task added!~%"))))))
       (2 (view-tasks))
       (3 (progn
            (format t "Enter the task name to delete: ")
            (let ((name (read-line)))
              (delete-task name))))
       (4 (progn
            (format t "Enter the task name to edit: ")
            (let ((name (read-line)))
              (format t "Enter new name: ")
              (let ((new-name (read-line)))
                (format t "Enter new priority: ")
                (let ((new-priority (read-line)))
                  (format t "Enter new due date: ")
                  (let ((new-due-date (read-line)))
                    (edit-task name new-name new-priority new-due-date)))))))
       (5 (progn
            (format t "Enter file path to save tasks: ")
            (let ((path (read-line)))
              (save-tasks *tasks* path)
              (format t "Tasks saved!~%"))))
       (6 (progn
            (format t "Enter file path to load tasks: ")
            (let ((path (read-line)))
              (setf *tasks* (load-tasks path))
              (format t "Tasks loaded!~%"))))
       (7 (return-from main))
       (t (format t "Invalid choice, try again.~%"))))))
