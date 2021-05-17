import 'package:business_banking/features/card_usage/bloc/card_summary_service_adapter.dart';
import 'package:business_banking/features/card_usage/model/card_summary_entity.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

class CardSummaryUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope? _scope;

  CardSummaryUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<CardSummaryEntity>()!;
    if (_scope == null) {
      final newTransaction = CardSummaryEntity();
      _scope = ExampleLocator()
          .repository
          .create<CardSummaryEntity>(newTransaction, _notifySubscribers);
    } else {
      _scope!.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope!, CardSummaryServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  CardSummaryViewModel buildViewModel(CardSummaryEntity entity) {
    return CardSummaryViewModel(transactionDetails: entity.transactionDetails);
  }
}
