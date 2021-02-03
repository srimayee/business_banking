import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_service_adapter.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_entity.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class GetSideCashUsecase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  GetSideCashUsecase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<GetSideCashEntity>();
    if (_scope == null) {
      final newGetSideCashEntity = GetSideCashEntity();
      _scope = ExampleLocator()
          .repository
          .create<GetSideCashEntity>(newGetSideCashEntity, notifySubscribers);
    } else {
      _scope.subscription = notifySubscribers;
    }

    final entity = ExampleLocator().repository.get<GetSideCashEntity>(_scope);
    _viewModelCallBack(buildViewModel(entity));
  }

  void submit() async {
    final entity = ExampleLocator().repository.get<GetSideCashEntity>(_scope);
    if (entity.amountRequested == '') {
      _viewModelCallBack(buildViewModelForLocalUpdateWithError(entity));
    } else {
      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope, GetSideCashServiceAdapter());
    }
  }

  void resetAll() {
    final entity = ExampleLocator().repository.get<GetSideCashEntity>(_scope);
    final GetSideCashEntity updatedEntity =
        entity.merge(badString: null, success: false, errors: null);

    ExampleLocator()
        .repository
        .update<GetSideCashEntity>(_scope, updatedEntity);
    notifySubscribers(updatedEntity);
  }

  GetSideCashViewModel buildViewModelForLocalUpdateWithError(
      GetSideCashEntity entity) {
    return GetSideCashViewModel(
        error: "Must input a request amout for side cash.");
  }

  void buildViewModelForValidInput() {
    _scope = ExampleLocator().repository.containsScope<GetSideCashEntity>();
    final getSideCashEntity =
        ExampleLocator().repository.get<GetSideCashEntity>(_scope);
    final GetSideCashEntity updatedEntity =
        getSideCashEntity.merge(badString: null);
    ExampleLocator()
        .repository
        .update<GetSideCashEntity>(_scope, updatedEntity);
    notifySubscribers(updatedEntity);
  }

  void buildViewModelForErrorInput() {
    _scope = ExampleLocator().repository.containsScope<GetSideCashEntity>();
    final getSideCashEntity =
        ExampleLocator().repository.get<GetSideCashEntity>(_scope);
    final updatedEntity =
        getSideCashEntity.merge(badString: "Input must contain numbers only.");

    ExampleLocator()
        .repository
        .update<GetSideCashEntity>(_scope, updatedEntity);
    notifySubscribers(updatedEntity);
  }

  void notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  GetSideCashViewModel buildViewModel(GetSideCashEntity entity) {
    return GetSideCashViewModel(
      amountRequested: entity.amountRequested,
      error: entity.badStringError,
      requestSuccess: entity.requestSuccess,
    );
  }

  void submitGetSideCash(String amt) async {
    _scope = ExampleLocator().repository.containsScope<GetSideCashEntity>();
    final getSideCashEntity =
        ExampleLocator().repository.get<GetSideCashEntity>(_scope);

    final updatedEntity = getSideCashEntity.merge(amount: amt);

    ExampleLocator()
        .repository
        .update<GetSideCashEntity>(_scope, updatedEntity);
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, GetSideCashServiceAdapter());
  }
}
