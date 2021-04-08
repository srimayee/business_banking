import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'item/todo_item_widget.dart';

class TodoScreen extends Screen {
  final TodoViewModel viewModel;

  TodoScreen(
      {@required this.viewModel})
      : assert(() { //what is this syntax?
        return viewModel != null;
      }());

  @override
  Widget build(BuildContext context) {
    print(viewModel.count);
    return Container(
      padding: EdgeInsets.all(6),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Text("To Do items:", style: TextStyle(fontSize: 24),),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: viewModel.count,
                itemBuilder: (BuildContext context, int index) {
                  print(index);
                  return Column(
                    children: [
                      Text("This is the ${index}th widget"),
                      new TodoItemWidget(index: index),
                      Divider(height: 4, indent: 16, endIndent: 16,)
                    ],
                  );
                }
              )
            ],
          ),
        )
      )
    );
  }
}