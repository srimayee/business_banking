import 'package:clean_framework/clean_framework.dart';
import 'package:equatable/equatable.dart';

class GetSideCashViewModel extends Equatable implements ViewModel {
  final String amountRequested;
  final bool requestSuccess;
  final String error;
  GetSideCashViewModel({this.amountRequested, this.error, this.requestSuccess});

  @override
  List<Object> get props =>
      [this.amountRequested, this.requestSuccess, this.error];
}
