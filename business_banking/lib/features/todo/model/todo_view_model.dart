import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TodoViewModel extends ViewModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoViewModel({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.completed,
  }); //assertions not required when @required syntax used...right?

  @override
  List<Object> get props => [userId, id, title, completed];
}