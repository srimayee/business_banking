import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_landing/api/hello_landing_service.dart';
import 'package:business_banking/features/hello_landing/api/hello_landing_service_response_model.dart';
import 'package:business_banking/example_locator.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  logger().setLogLevel(LogLevel.verbose);
  
  // Beginning of test, need to set up mock services
  test('HelloLandingService success', () async {
    final service = HelloLandingService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        HelloLandingServiceResponseModel.fromJson({}));
  });
}