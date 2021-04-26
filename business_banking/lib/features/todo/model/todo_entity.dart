import 'package:clean_framework/clean_framework.dart';

class TodoEntity extends Entity {
  final int numberOfTodoTask;

  TodoEntity({
    List<EntityFailure> errors = const [],
    int? numberOfTodoTask,
  })  : numberOfTodoTask = numberOfTodoTask ?? 0,
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        numberOfTodoTask,
      ];

  @override
  merge({
    errors,
    int? numberOfTodoTask,
  }) {
    return TodoEntity(
      errors: errors ?? this.errors,
      numberOfTodoTask: numberOfTodoTask ?? this.numberOfTodoTask,
    );
  }
}
