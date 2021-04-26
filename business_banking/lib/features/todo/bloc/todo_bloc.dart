import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'todo_usecase.dart';

class TodoBloc extends Bloc {
  late TodoUseCase _useCase;

  final todoViewModelPipe = Pipe<TodoViewModel>();

  @override
  void dispose() {
    todoViewModelPipe.dispose();
  }

  TodoBloc() {
    _useCase = TodoUseCase(
        (viewModel) => todoViewModelPipe.send(viewModel as TodoViewModel));
    todoViewModelPipe.whenListenedDo(_useCase.create);
  }
}
