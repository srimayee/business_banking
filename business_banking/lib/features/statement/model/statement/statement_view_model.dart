import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/statement/model/statement.dart';
import 'package:clean_framework/clean_framework.dart';

class StatementViewModel extends ViewModel {
  final List<Statement> statements;
  final serviceResponseStatus;

  StatementViewModel({
    required this.statements,
    this.serviceResponseStatus = ServiceResponseStatus.unknown,
  });

  @override
  List<Object?> get props => [statements];
}
