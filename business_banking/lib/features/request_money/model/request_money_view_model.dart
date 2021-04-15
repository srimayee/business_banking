import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class RequestMoneyViewModel extends ViewModel {
  final String name;
  final String email;
  final String imageUrl;
  final double amount;
  final String memo;

  RequestMoneyViewModel({
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.amount,
    required this.memo,
  }) : assert(name != null &&
      email != null &&
      imageUrl != null &&
      amount != null &&
      memo != null);

  @override
  List<Object> get props => [name, email, imageUrl, amount, memo];
}