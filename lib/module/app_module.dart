import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import '../page/page.dart';

class TaskModule extends ModuleWidget {
  @override
  List<Bloc<BlocBase>> get blocs => [];

  //Inject the dependencies
  @override
  List<Dependency> get dependencies => [];

  //main widget
  @override
  Widget get view => TaskPage();

  //shortcut to pick up dependency injections from this module
  static Inject get to => Inject<TaskModule>.of();

}