import 'package:clean_framework/clean_framework.dart';

class TodoViewModel extends ViewModel {
  final int numberOfTodoTask;

  TodoViewModel({
    required this.numberOfTodoTask,
  });

  @override
  List<Object> get props => [numberOfTodoTask];
}