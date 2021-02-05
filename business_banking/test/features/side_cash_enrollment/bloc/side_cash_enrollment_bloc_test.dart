import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_usecase.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSideCashEnrollmentUseCase extends Mock
    implements SideCashEnrollmentUsecase {


}

class FakeSideCashEnrollmentUsecase extends Fake implements SideCashEnrollmentUsecase {
  @override
  bool updateFormWithSelectedAccount(String account) {
    print("MOCK updateFormWithSelectedAccount called");
    return true;
  }
}

main() {
  group("Side Cash Enrollment Bloc Tests: ", () {
    SideCashEnrollmentBloc bloc;
    setUpAll(() {
      bloc = SideCashEnrollmentBloc();
    });
    tearDownAll(() {
      bloc.dispose();
    });

    test('SideCashEnrollmentBloc gets ADVERTISEMENT view model', () {
      bloc.enrollmentAdvertisementPipe.receive.listen(expectAsync1((model) {
        expect(model, isA<EnrollmentAdvertisementViewModel>());
      }));
    });

    //TODO this is not mocked
    test('SideCashEnrollmentBloc gets FORM view model', () {
      bloc.enrollmentFormPipe.receive.listen(expectAsync1((model) {
        expect(model, isA<EnrollmentFormViewModel>());
      }));
    });

    //TODO this is not mocked
    test('SideCashEnrollmentBloc gets Completion view model', () {
      bloc.enrollmentCompletionPipe.receive.listen(expectAsync1((model) {
        expect(model, isA<EnrollmentCompletionViewModel>());
      }));
    });

    // TODO FAILING
    test("update form with selected account", ()async {
      final mockUseCase = MockSideCashEnrollmentUseCase();
      // final fakeUseCase = FakeSideCashEnrollmentUsecase();
      final bloc = SideCashEnrollmentBloc(testUseCase: mockUseCase);

      bloc.updateFormWithSelectedAccountPipe.send("any");
      print("before verify");

      // expect(fakeUseCase.updateFormWithSelectedAccount("any"), true);
      verify(mockUseCase.updateFormWithSelectedAccount(any)).called(1);
    });

    //
    // test("3: usecase callback triggers viewModelPipe.send", () {});
    //
    // test("3. getEnrollmentFormRequest.whenListenedTo calls usecase.create",
    //     () {});
  });
}
