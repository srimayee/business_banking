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
    final List<dynamic> todoItems = viewModel.todos;
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
                itemCount: todoItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return TodoItem(todoInfo: todoItems[index]);
                }
              )
            ],
          ),
        )
      )
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key key,
    @required this.todoInfo
  }) : super(key: key);

  final Map<String, dynamic> todoInfo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${todoInfo["title"]}"),
      subtitle: Text("User ID: ${todoInfo["userId"]} — Todo ID: ${todoInfo["id"]}"),
      leading: (todoInfo["completed"])
          ? CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.done, color: Colors.white,),)
          : CircleAvatar(backgroundColor: Colors.redAccent, child: Icon(Icons.error_outline, color: Colors.white,),),
    );
  }
}
