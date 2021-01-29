import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_service_adapter.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_entity.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SideCashDetailsUsecase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  SideCashDetailsUsecase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<SideCashDetailsEntity>();
    if (_scope == null) {
      final newSideCashDetailsEntity = SideCashDetailsEntity();
      _scope = ExampleLocator().repository.create<SideCashDetailsEntity>(
          newSideCashDetailsEntity, notifySubscribers);
    } else {
      _scope.subscription = notifySubscribers;
    }

    ExampleLocator()
        .repository
        .runServiceAdapter(_scope, SideCashDetailsServiceAdapter());
  }

  void notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  SideCashDetailsViewModel buildViewModel(SideCashDetailsEntity entity) {
    return SideCashDetailsViewModel(
      grossSideCashBalance: entity.grossSideCashBalance,
      interest: entity.interest,
      paymentMin: entity.paymentMin,
      remainingCredit: entity.remainingCredit,
    );
  }
}
