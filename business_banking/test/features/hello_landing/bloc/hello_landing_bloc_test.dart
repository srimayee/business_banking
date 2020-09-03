import 'package:business_banking/example_locator.dart';
import 'package:business_banking/features/hello_landing/bloc/hello_landing_bloc.dart';
import 'package:business_banking/features/hello_landing/model/hello_landing_view_model.dart';
import 'package:business_banking/features/hello_landing/bloc/hello_landing_service_adapter.dart';
import 'package:business_banking/features/hello_landing/model/hello_landing_entity.dart';
import 'package:business_banking/features/hello_landing/api/hello_landing_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HelloLandingBloc gets view model', () {
    final bloc = HelloLandingBloc();

    bloc.helloLandingViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<HelloLandingViewModel>());
    }));
  });
  
  test('Entity is created by service adapter', () {
    final entity = HelloLandingServiceAdapter().createEntity(
        HelloLandingEntity(),
        HelloLandingServiceResponseModel.fromJson({}));

    expect(entity,
        HelloLandingEntity());
  });
}