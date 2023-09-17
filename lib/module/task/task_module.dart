import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:newproject/module/task/task_controller.dart';

import '../../page/page.dart';

class TaskModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [Bloc((i) => TaskController())];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => TaskPage();

  static Inject get to => Inject<TaskModule>.of();
}
