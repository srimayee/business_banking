import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class QuickPayViewModel extends ViewModel {
  final String name;
  final String email;
  final String imageUrl;

  QuickPayViewModel({
    @required this.name,
    @required this.email,
    @required this.imageUrl
  }) : assert(name != null &&
              email != null &&
              imageUrl != null);

  @override
  List<Object> get props => [name, email, imageUrl];
}