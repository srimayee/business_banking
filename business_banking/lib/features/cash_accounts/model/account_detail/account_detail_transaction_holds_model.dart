import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AccountDetailsTransactionHoldsModel extends Equatable
    implements JsonResponseModel {
  final String holdTitle;
  final String holdInitiationDate;
  final String holdInitiator;
  final String holdDescription;
  final String holdAmount;

  AccountDetailsTransactionHoldsModel(
      {@required this.holdTitle,
      @required this.holdInitiationDate,
      @required this.holdInitiator,
      @required this.holdDescription,
      @required this.holdAmount})
      : assert(holdTitle != null &&
            holdInitiationDate != null &&
            holdInitiator != null &&
            holdDescription != null &&
            holdAmount != null);

  AccountDetailsTransactionHoldsModel.fromJson(Map<String, dynamic> json)
      : holdTitle = json['holdTitle'],
        holdInitiationDate = json['holdInitiationDate'],
        holdInitiator = json['holdInitiator'],
        holdDescription = json['holdDescription'],
        holdAmount = json['holdAmount'];

  @override
  // TODO: implement props
  List<Object> get props => [
        holdTitle,
        holdInitiationDate,
        holdInitiator,
        holdDescription,
        holdAmount
      ];
}
