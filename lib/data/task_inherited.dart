import 'package:flutter/material.dart';

import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task(
        nome: "Aprendendo Dart",
        foto: 'assets/images/coruja_1.jpg',
        dificuldade: 0),
    Task(
        nome: "Aprendendo Fluttter",
        foto: 'assets/images/coruja_2.jpg',
        dificuldade: 1),
    Task(
        nome: "Aprendendo Node",
        foto: 'assets/images/coruja_3.jpg',
        dificuldade: 2),
    Task(
        nome: "Aprendendo Dart",
        foto: 'assets/images/coruja_1.jpg',
        dificuldade: 3),
    Task(
        nome: "Aprendendo Fluttter",
        foto: 'assets/images/coruja_2.jpg',
        dificuldade: 4),
    Task(
        nome: "Aprendendo Node",
        foto: 'assets/images/coruja_3.jpg',
        dificuldade: 5),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(nome: name, foto: photo, dificuldade: difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
