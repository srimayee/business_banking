import 'package:business_banking/features/todo/bloc/item/todo_item_bloc.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'todo_item_presenter.dart';

class TodoItemWidget extends StatelessWidget {
  final bool debugEnabled = false;
  final int index;

  TodoItemWidget({@required this.index});

  @override
  Widget build(BuildContext context) {
    if (debugEnabled) {
      logger().debug("Widget Built");
    }
    print("in widget: index = $index");
    return new BlocProvider<TodoItemBloc>(
      create: (_) => new TodoItemBloc(index: index),
      child: new TodoItemPresenter(),
    );
  }
}