# TaskMaster - A CLI Task Management Tool in Common Lisp

## Overview
TaskMaster is a command-line interface (CLI) application written in Common Lisp for managing tasks. It supports creating, viewing, editing, deleting, saving, and loading tasks. TaskMaster can manage task priorities, due dates, and names, providing a simple, yet powerful task tracking experience.

## Features
- **Task Creation**: Add tasks with names, priority levels, and due dates.
- **View Tasks**: See all current tasks.
- **Edit/Delete Tasks**: Modify or remove tasks as needed.
- **Save/Load Tasks**: Persist tasks to a file for future sessions.

## Usage
1. Run the `taskmaster.lisp` script.
2. Follow the on-screen menu to manage tasks.

## File Structure
- **taskmaster.lisp**: Main CLI logic.
- **task-model.lisp**: Defines the Task structure.
- **task-storage.lisp**: Handles saving/loading tasks.
- **task-manager.lisp**: Core logic for task operations.
