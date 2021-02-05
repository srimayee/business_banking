import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_service_adapter.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_entity.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class GetSideCashUsecase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope scope;
  Repository repo = ExampleLocator().repository;

  GetSideCashUsecase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    scope = repo.containsScope<GetSideCashEntity>();
    if (scope == null) {
      final newGetSideCashEntity = GetSideCashEntity();
      scope = repo.create<GetSideCashEntity>(
          newGetSideCashEntity, notifySubscribers);
    } else {
      scope.subscription = notifySubscribers;
    }

    final entity = repo.get<GetSideCashEntity>(scope);
    _viewModelCallBack(buildViewModel(entity));
  }

  GetSideCashEntity resetAll() {
    final entity = repo.get<GetSideCashEntity>(scope);
    final GetSideCashEntity updatedEntity =
        entity.merge(badString: null, success: false, errors: null, amount: '');

    repo.update<GetSideCashEntity>(scope, updatedEntity);
    notifySubscribers(updatedEntity);
    return updatedEntity;
  }

  GetSideCashViewModel buildViewModelForLocalUpdateWithError() {
    return GetSideCashViewModel(
        error: "Must input a request amout for side cash.");
  }

  void buildViewModelForValidInput() {
    scope = repo.containsScope<GetSideCashEntity>();
    final getSideCashEntity = repo.get<GetSideCashEntity>(scope);
    final GetSideCashEntity updatedEntity =
        getSideCashEntity.merge(badString: null);
    repo.update<GetSideCashEntity>(scope, updatedEntity);
    notifySubscribers(updatedEntity);
  }

  void buildViewModelForErrorInput() {
    scope = repo.containsScope<GetSideCashEntity>();
    final getSideCashEntity = repo.get<GetSideCashEntity>(scope);
    final updatedEntity =
        getSideCashEntity.merge(badString: "Input must contain numbers only.");

    repo.update<GetSideCashEntity>(scope, updatedEntity);
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

  Future<GetSideCashEntity> submitGetSideCash(String amt) async {
    scope = ExampleLocator().repository.containsScope<GetSideCashEntity>();
    final getSideCashEntity =
        ExampleLocator().repository.get<GetSideCashEntity>(scope);

    final GetSideCashEntity updatedEntity =
        getSideCashEntity.merge(amount: amt);

    ExampleLocator().repository.update<GetSideCashEntity>(scope, updatedEntity);
    await ExampleLocator()
        .repository
        .runServiceAdapter(scope, GetSideCashServiceAdapter());

    return GetSideCashEntity();
  }
}
