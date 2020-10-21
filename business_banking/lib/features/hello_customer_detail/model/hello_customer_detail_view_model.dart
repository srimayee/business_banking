import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class HelloCustomerDetailViewModel extends ViewModel {
  final String name;
  final String currentTimeString;

  HelloCustomerDetailViewModel({
    @required this.name,
    this.currentTimeString = ""
  }) : assert(name != null);
}
