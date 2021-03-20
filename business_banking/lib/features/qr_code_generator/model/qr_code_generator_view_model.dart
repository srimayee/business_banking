import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class QRCodeGeneratorViewModel extends ViewModel {
  final String seed;
  final String expiresAt;

  QRCodeGeneratorViewModel({@required this.seed, @required this.expiresAt})
      : assert(seed != null && expiresAt != null);

  @override
  List<Object> get props => [seed, expiresAt];
}
