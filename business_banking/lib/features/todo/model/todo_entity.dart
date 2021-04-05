import 'package:clean_framework/clean_framework.dart';

class TodoEntity extends Entity {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoEntity({
    List<EntityFailure> errors = const [],
    int userId,
    int id,
    String title,
    bool completed,
  })  : userId = userId ?? 1,
        id = id ?? 1,
        title = title ?? "No title",
        completed = completed ?? false,
        super(errors: errors);

  @override
  List<Object> get props => [errors, userId, id, title, completed];

  @override
  merge({errors, int userId, int id, String title, bool completed}) {
    return TodoEntity(
      errors: errors ?? this.errors,
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed
    );
  }
}