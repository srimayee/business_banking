import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_entity.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SideCashDetailsUsecase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  SideCashDetailsUsecase(Function(ViewModel) viewModelCallBack, {scope})
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack,
        _scope = scope;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<SideCashDetailsEntity>();
    if (_scope == null) {
      final newSideCashDetailsEntity = SideCashDetailsEntity();
      _scope = ExampleLocator().repository.create<SideCashDetailsEntity>(
          newSideCashDetailsEntity, notifySubscribers);
    } else {
      _scope.subscription = notifySubscribers;
    }
    final entity =
        ExampleLocator().repository.get<SideCashDetailsEntity>(_scope);

    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  void notifySubscribers(entity) {
    print('notify subscribers');
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  SideCashDetailsViewModel buildViewModelForServiceUpdate(
      SideCashDetailsEntity entity) {
    return entity.hasErrors()
        ? buildViewModelForError(entity)
        : buildViewModelForSuccess(entity);
  }

  SideCashDetailsViewModel buildViewModelForSuccess(
          SideCashDetailsEntity entity) =>
      SideCashDetailsViewModel(
        grossSideCashBalance: entity.grossSideCashBalance,
        interest: entity.interest,
        paymentMin: entity.paymentMin,
        remainingCredit: entity.remainingCredit,
      );

  SideCashDetailsViewModel buildViewModelForError(
          SideCashDetailsEntity entity) =>
      SideCashDetailsViewModel();
}
