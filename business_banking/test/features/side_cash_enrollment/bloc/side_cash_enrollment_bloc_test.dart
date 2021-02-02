import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_usecase.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSideCashEnrollmentUsecase extends Mock
    implements SideCashEnrollmentUsecase {}

main() {
  group("Side Cash Enrollment Bloc Tests", () {
    // TODO This is not mocked
    test('SideCashDetailsBloc gets ADVERTISEMENT view model', () {
      final bloc = SideCashEnrollmentBloc();
      bloc.enrollmentAdvertisementPipe.receive.listen(expectAsync1((model) {
        expect(model, isA<EnrollmentAdvertisementViewModel>());
        bloc.dispose();
      }));
    });

    //TODO this is not mocked
    test('SideCashDetailsBloc gets FORM view model', () {
      final bloc = SideCashEnrollmentBloc();
      bloc.enrollmentFormPipe.receive.listen(expectAsync1((model) {
        expect(model, isA<EnrollmentFormViewModel>());
        bloc.dispose();
      }));
    });

    // view model callback is Async
    test("2. usecase is given a viewModel callback", () {});

    test("3: usecase callback triggers viewModelPipe.send", () {});

    test("3. getEnrollmentFormRequest.whenListenedTo calls usecase.create",
        () {});
  });
}
