import 'package:business_banking/features/todo/bloc/todo_bloc.dart';
import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TodoBloc gets view model, mock', () {
    final bloc = TodoBloc();

    bloc.todoViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<TodoViewModel>());
      expect(model.numberOfTodoTask, 2);
    }));
  });
  test('TodoBloc gets view model, real', () {
    final bloc = TodoBloc();

    bloc.todoViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<TodoViewModel>());
      expect(model.numberOfTodoTask, 2);
    }));
  });
}
