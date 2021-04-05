import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class TodoServiceResponseModel extends Equatable implements JsonResponseModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoServiceResponseModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'] ?? 1,
      id = json['id'] ?? 1,
      title = json['title'] ?? "No title",
      completed = json['completed'] ?? false;

  @override
  List<Object> get props => [userId, id, title, completed];
}