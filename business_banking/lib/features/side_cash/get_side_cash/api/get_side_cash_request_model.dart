import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class GetSideCashRequestModel extends Equatable implements JsonRequestModel {
  final String amountRequested;
  GetSideCashRequestModel({this.amountRequested});

  Map<String, dynamic> toJson() {
    return {"amountRequested": this.amountRequested};
  }

  @override
  List<Object> get props => [this.amountRequested];
}
