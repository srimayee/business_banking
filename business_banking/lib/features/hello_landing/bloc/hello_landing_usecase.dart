import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_landing/model/hello_landing_view_model.dart';
import 'package:business_banking/features/hello_landing/model/hello_landing_entity.dart';
import 'package:business_banking/features/hello_landing/bloc/hello_landing_service_adapter.dart';
import 'package:business_banking/example_locator.dart';

class HelloLandingUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  
  HelloLandingUseCase(Function(ViewModel) viewModelCallBack) : assert(viewModelCallBack != null), _viewModelCallBack = viewModelCallBack;
  
  void execute() async {
    final scope = ExampleLocator()
        .repository
        .create<HelloLandingEntity>(HelloLandingEntity(), _notifySubscribers);
      
    await ExampleLocator()
        .repository
        .runServiceAdapter(scope, HelloLandingServiceAdapter());
  }
  
  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }
  
  HelloLandingViewModel buildViewModel(HelloLandingEntity entity) {
    return HelloLandingViewModel();
  }
}