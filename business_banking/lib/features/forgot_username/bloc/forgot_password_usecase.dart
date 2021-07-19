import 'package:business_banking/features/forgot_username/model/forgot_password_entity.dart';
import 'package:business_banking/features/forgot_username/model/forgot_password_view_model.dart';
import 'package:business_banking/features/forgot_username/bloc/forgot_password_service_adapter.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class ForgotPasswordUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope? _scope;

  ForgotPasswordUseCase(Function(ViewModel) viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<ForgotPasswordEntity>();
    if (_scope == null) {
      final newEntity = ForgotPasswordEntity();
      _scope = ExampleLocator()
          .repository
          .create<ForgotPasswordEntity>(newEntity, _notifySubscribers);
    } else {
      _scope!.subscription = _notifySubscribers;
    }
    final entity = ExampleLocator().repository.get<ForgotPasswordEntity>(_scope!);
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  void submit() async {
    final entity = ExampleLocator().repository.get<ForgotPasswordEntity>(_scope!);
    if (entity.email == '') {
      _viewModelCallBack(buildViewModelForLocalUpdateWithError(entity));
    } else {
      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope!, ForgotPasswordServiceAdapter());
    }
  }

  void updateEmail(String email) async {
    final entity = ExampleLocator().repository.get<ForgotPasswordEntity>(_scope!);
    final updatedEntity = entity.merge(email: email);
    ExampleLocator()
        .repository
        .update<ForgotPasswordEntity>(_scope!, updatedEntity as ForgotPasswordEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  ForgotPasswordViewModel buildViewModelForServiceUpdate(ForgotPasswordEntity entity) {
    if (entity.hasErrors()) {
      return ForgotPasswordViewModel(
          email: entity.email,
          serviceStatus: ServiceStatus.fail);
    } else {
      return ForgotPasswordViewModel(
          email: entity.email,
          serviceStatus: ServiceStatus.success);
    }
  }

  ForgotPasswordViewModel buildViewModelForLocalUpdate(ForgotPasswordEntity entity) {
    return ForgotPasswordViewModel(
      email: entity.email,
    );
  }

  ForgotPasswordViewModel buildViewModelForLocalUpdateWithError(ForgotPasswordEntity entity) {
    return ForgotPasswordViewModel(
        email: entity.email,
        dataStatus: DataStatus.invalid);
  }
}
