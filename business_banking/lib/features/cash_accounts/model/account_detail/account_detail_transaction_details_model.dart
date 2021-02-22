// import 'package:clean_framework/clean_framework_defaults.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
//
// class AccountDetailTransactionDetailsModel extends Equatable
//     implements JsonResponseModel {
//   final String transactionInitiator;
//   final String transactionAlias;
//   final String initiatorTelephone;
//   final String initiatorAddress;
//   final String transactionTimestamp;
//   final String transactionInitiationDate;
//   final String transactionPostDate;
//
//   AccountDetailTransactionDetailsModel({
//     @required this.transactionInitiator,
//     @required this.transactionAlias,
//     @required this.initiatorTelephone,
//     @required this.initiatorAddress,
//     @required this.transactionTimestamp,
//     @required this.transactionInitiationDate,
//     @required this.transactionPostDate,
//   }) : assert(transactionInitiator != null &&
//             transactionAlias != null &&
//             initiatorAddress != null &&
//             transactionTimestamp != null &&
//             transactionInitiationDate != null &&
//             transactionPostDate != null);
//
//   AccountDetailTransactionDetailsModel.fromJson(Map<String, dynamic> json)
//       : transactionInitiator = json['transactionInitiator'],
//         transactionAlias = json['transactionAlias'],
//         initiatorTelephone = json['initiatorTelephone'],
//         initiatorAddress = json['initiatorAddressNumber'],
//         transactionTimestamp = json['transactionTimestamp'],
//         transactionInitiationDate = json['transactionInitiationDate'],
//         transactionPostDate = json['transactionPostDate'];
//
//   @override
//   List<Object> get props => [
//         transactionInitiator,
//         transactionAlias,
//         initiatorTelephone,
//         initiatorAddress,
//         transactionTimestamp,
//         transactionInitiationDate,
//         transactionPostDate,
//       ];
// }
