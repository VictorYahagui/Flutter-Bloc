import 'package:mobx/mobx.dart';
import '../../model/model.dart';

class TaskController = _TaskControllerBase with _$TaskController;

abstract class _TaskControllerBase with Store {
  @observable
  ObservableList<Model> tasks = ObservableList<Model>();

  @action
  void addTask(String taskName) {
    tasks.add(Model(name: taskName));
  }

  @action
  void removeTask(int index) {
    tasks.removeAt(index);
  }
}