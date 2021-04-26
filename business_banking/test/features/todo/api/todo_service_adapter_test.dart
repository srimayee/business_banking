import 'package:business_banking/features/todo/api/todo_service_response_model.dart';
import 'package:business_banking/features/todo/bloc/todo_service_adapter.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:test/test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = TodoServiceAdapter().createEntity(
     TodoEntity(),
      TodoServiceResponseModel.fromJson({
        "todoTasks": []
      }),
    );

    expect(
        entity,
        TodoEntity(
          numberOfTodoTask: 0,
        ));
  });
}