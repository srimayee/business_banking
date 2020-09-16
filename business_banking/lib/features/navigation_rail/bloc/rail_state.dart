import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class RailState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialHomeState extends RailState {
  final int selectedIndex;

  InitialHomeState({@required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}