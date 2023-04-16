import 'package:flutter/material.dart';
import 'package:todo_app/core/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final List<TodoModel> _tasks = [];

  List<TodoModel> get allTasks {
    return [..._tasks];
  }

  void addNewTask(String task) {
    _tasks.add(TodoModel(
      todoTitle: task,
      completed: false,
    ));
    notifyListeners();
  }

  void toggleCompleted(TodoModel tasks) {
    final taskIndex = _tasks.indexOf(tasks);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTask(TodoModel task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
