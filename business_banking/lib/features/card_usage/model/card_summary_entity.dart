import 'package:business_banking/features/card_usage/model/card_summary_model.dart';
import 'package:clean_framework/clean_framework.dart';

class CardSummaryEntity extends Entity {
  final List<CardSummaryModel> transactionDetails;

  CardSummaryEntity({
    List<EntityFailure> errors = const [],
    List<CardSummaryModel> transactionDetails = const [],
  })  : transactionDetails = transactionDetails,
        super(errors: errors);

  @override
  List<Object> get props => [errors, transactionDetails];

  @override
  merge({errors, String name, String lastFour, double balance}) {
    return CardSummaryEntity(
      errors: errors ?? this.errors,
      transactionDetails: transactionDetails ?? this.transactionDetails,
    );
  }
}
