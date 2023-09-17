import '../../model/model.dart';

abstract class TaskEvent {}

class GetTask extends TaskEvent {}

class PostTask extends TaskEvent {
  final Model task;

  PostTask({required this.task});
}
class DeleteTask extends TaskEvent {
  final Model task;

  DeleteTask({required this.task});
}
