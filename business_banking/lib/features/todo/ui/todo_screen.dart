import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TodoScreen extends Screen {
  final TodoViewModel viewModel;

  TodoScreen(
      {@required this.viewModel})
      : assert(() { //what is this syntax?
        return viewModel != null;
      }());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: Card(
        child: ListTile(
          title: Text("${viewModel.title}"),
          subtitle: Text("User ID: ${viewModel.userId}\nID: ${viewModel.id}"),
          leading: (viewModel.completed)
            ? CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.done, color: Colors.white,),)
            : CircleAvatar(backgroundColor: Colors.redAccent, child: Icon(Icons.error_outline, color: Colors.white,),),
          contentPadding: EdgeInsets.all(8.0),
        ),
      )
    );
  }
}