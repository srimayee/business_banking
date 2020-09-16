import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class RailEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class SelectDestinationEvent extends RailEvent {
  final int selectedIndex;

  SelectDestinationEvent({@required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];

}