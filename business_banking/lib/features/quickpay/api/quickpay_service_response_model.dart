import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class QuickPayServiceResponseModel extends Equatable
  implements JsonResponseModel{
  final String name;
  final String email;
  final String imageUrl;

  QuickPayServiceResponseModel.fromJson(Map<String, dynamic> json)
  : name = json['name'] ?? 'Username',
  email = json['email'] ?? 'username@gmail.com',
  imageUrl = json['imageUrl'] ?? '';

  @override
  List<Object> get props => [name, email, imageUrl];
}