import 'package:clean_framework/clean_framework.dart';

class TodoEntity extends Entity {
  final List<dynamic> todos;

  TodoEntity({
    List<EntityFailure> errors = const [],
    List<dynamic> todos,
  })  : todos = todos ?? [{"userId": 1, "id": 1, "title": "No title", "completed": false}],
        super(errors: errors);

  @override
  List<Object> get props => [errors, todos];

  @override
  merge({errors, List<dynamic> todos}) {
    return TodoEntity(
      errors: errors ?? this.errors,
      todos: todos ?? this.todos,
    );
  }
}