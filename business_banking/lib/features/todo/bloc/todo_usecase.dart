import 'package:business_banking/features/todo/bloc/todo_service_adapter.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TodoUseCase extends UseCase {
  late final ViewModelCallback<ViewModel> _viewModelCallback;
  TodoUseCase(ViewModelCallback<ViewModel> viewModelCallback)
      : _viewModelCallback = viewModelCallback;

  void create() async {
    final scope = ExampleLocator()
        .repository
        .create<TodoEntity>(TodoEntity(), _notifySubscribers);

    await ExampleLocator()
        .repository
        .runServiceAdapter(scope, TodoServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  TodoViewModel buildViewModel(
    TodoEntity todoListEntityModel,
  ) {
    return TodoViewModel(
        numberOfTodoTask: todoListEntityModel.numberOfTodoTask,
        );
  }
}
