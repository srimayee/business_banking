import 'package:clean_framework/clean_framework_defaults.dart';

class TodoServiceResponseModel extends JsonResponseModel {
  final int numberOfTodoTask;

  TodoServiceResponseModel.fromJson(Map<String, dynamic> json)
      : numberOfTodoTask = json["todoTasks"].length ?? 0;

  @override
  List<Object> get props => [numberOfTodoTask];
}
