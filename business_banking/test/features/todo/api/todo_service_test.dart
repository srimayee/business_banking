import 'package:business_banking/features/todo/api/todo_service.dart';
import 'package:business_banking/features/todo/api/todo_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

void main() {
  test('Todo Service success', () async {
    final service = TodoService();
    final Either<ServiceFailure, TodoServiceResponseModel> eitherResponse =
        await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
      eitherResponse.fold((_) {}, (m) => m),
      TodoServiceResponseModel.fromJson({
        "todoTasks":
        [
          {
            "id":"123456",
            "task": "Hello Task",
            "description": "Hello task description",
            "completed": false
          },
          {
            "id":"654321",
            "task": "Hello Task",
            "description": "Hello task description",
            "completed": false
          }
        ]
      }
      ),
    );
  });
}
