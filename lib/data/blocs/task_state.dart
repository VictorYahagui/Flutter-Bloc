import 'package:newproject/model/model.dart';

abstract class TaskState {
  final List<Model> tasks;

  TaskState({required this.tasks});
}

class TaskInitialState extends TaskState {
  TaskInitialState() : super(tasks: []);
}

class TaskLoadingState extends TaskState {
  TaskLoadingState() : super(tasks: []);
}

class TaskLoadedState extends TaskState {
  TaskLoadedState({required List<Model> tasks}) : super(tasks: tasks);
}

class TaskErrorState extends TaskState {
  final Exception exception;

  TaskErrorState({required this.exception}) : super(tasks: []);
}
