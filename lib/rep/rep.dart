import '../model/model.dart';

class Rep {
    final List<Model> _task = [];
    Future<List<Model>> getTask() async {
      _task.addAll([
        Model(name: 'a fazer'),
        Model(name: 'a fazer 1'),
        Model(name: 'a fazer 2'),
        Model(name: 'a fazer 3'),
      ]);
      return Future.delayed(
        const Duration(seconds: 2),
        () => _task,
      );
    }
    Future<List<Model>> postTask({required Model task}) async {
      _task.add(task);

      return Future.delayed(
        const Duration(seconds: 2),
        () => _task,
      );
    }
        Future<List<Model>> deleteTask({required Model task}) async {
      _task.remove(task);
      return Future.delayed(
        const Duration(seconds: 2),
        () => _task,
      );
    }
}
