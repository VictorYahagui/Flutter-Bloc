import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:newproject/data/blocs/task_bloc.dart';
import 'package:newproject/data/blocs/task_event.dart';
import 'package:newproject/data/blocs/task_state.dart';
import 'package:newproject/module/app_module.dart';

import '../model/model.dart';
import '../module/task/task_controller.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final controller = TaskModule.to.getBloc<TaskController>();
  late final TaskBloc _TaskBloc;
  @override
  void initState() {
    super.initState();
    _TaskBloc = TaskBloc();
    _TaskBloc.inputTask.add(GetTask());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo'),
        centerTitle: true,
      ),
      body: StreamBuilder<TaskState>(
        stream: _TaskBloc.outputTask,
        builder: (context, state) {
          if (state.data is TaskLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.data is TaskLoadedState) {
            final list = state.data?.tasks ?? [];
            return Observer(
              builder: (_) => Expanded(
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Center(
                            child: Text(
                          index.toString(),
                        )),
                      ),
                      title: Text(
                        list[index].name,
                        textAlign: TextAlign.center,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          controller.removeTask(index);
                        },
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Center(
              child: Text('Error'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.addTask('Caminhar');
        },
      ),
    );
  }

  @override
  void dispose() {
    _TaskBloc.inputTask.close();
    super.dispose();
  }
}
