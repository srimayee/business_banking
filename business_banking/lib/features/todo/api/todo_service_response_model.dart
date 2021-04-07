import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class TodoServiceResponseModel extends Equatable implements JsonResponseModel {
  final List<dynamic> todos;

  TodoServiceResponseModel.fromJson(Map<String, dynamic> json)
      : todos = json['todos'] ?? [{"userId": 1, "id": 1, "title": "No title", "completed": false}];

  @override
  List<Object> get props => [todos];
}