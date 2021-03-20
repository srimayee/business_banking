import 'package:business_banking/features/qr_code_generator/bloc/qr_code_generator_service_adapter.dart';
import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_entity.dart';
import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class QRCodeGeneratorUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  QRCodeGeneratorUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  Future<void> create() async {
    _scope = ExampleLocator().repository.containsScope<QRCodeGeneratorEntity>();
    if (_scope == null) {
      final newQRCodeGeneratorEntity = QRCodeGeneratorEntity();
      _scope = ExampleLocator().repository.create<QRCodeGeneratorEntity>(
          newQRCodeGeneratorEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, QRCodeGeneratorServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  QRCodeGeneratorViewModel buildViewModel(QRCodeGeneratorEntity entity) {
    return QRCodeGeneratorViewModel(
        seed: entity.seed, expiresAt: entity.expiresAt);
  }
}
