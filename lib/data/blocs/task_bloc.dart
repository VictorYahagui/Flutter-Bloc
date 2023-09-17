import 'dart:async';

import 'package:newproject/data/blocs/task_event.dart';
import 'package:newproject/data/blocs/task_state.dart';
import 'package:newproject/model/model.dart';

import '../../rep/rep.dart';

class TaskBloc {
  final _repository = Rep();

  final StreamController<TaskEvent> _inputTaskController =
      StreamController<TaskEvent>();

  final StreamController<TaskState> _outputTaskController =
      StreamController<TaskState>();

  Sink<TaskEvent> get inputTask => _inputTaskController.sink;

  Stream<TaskState> get outputTask => _outputTaskController.stream;

  TaskBloc() {
    _inputTaskController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(TaskEvent event) async {

    List<Model> tasks = [];

    _outputTaskController.add(TaskLoadingState());

    if (event is GetTask) {
      tasks = await _repository.getTask();
    } else if (event is PostTask) {
      tasks = await _repository.postTask(task: event.task);
    } else if (event is DeleteTask ){
      tasks = await _repository.deleteTask(task: event.task);
    }

    _outputTaskController.add(TaskLoadedState(tasks: tasks));
  }
}
