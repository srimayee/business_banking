import 'package:business_banking/features/statement/model/statement.dart';
import 'package:clean_framework/clean_framework.dart';

class StatementViewModel extends ViewModel {
  final List<Statement> statements;

  StatementViewModel({
    required this.statements,
  });

  @override
  List<Object?> get props => [statements];
}
