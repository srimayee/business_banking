import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TodoViewModel extends ViewModel {
  final List<dynamic> todos;

  TodoViewModel({
    @required this.todos,
  }); //assertions not required when @required syntax used...right?

  @override
  List<Object> get props => [todos];
}