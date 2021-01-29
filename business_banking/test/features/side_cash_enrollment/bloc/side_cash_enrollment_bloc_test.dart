

import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_get_enrollment_form_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSideCashGetEnrollmentFormUsecase extends Mock implements SideCashGetEnrollmentFormUsecase {}

main(){
  // SideCashEnrollmentBloc bloc;
  // setUp(() {
  //   bloc = SideCashEnrollmentBloc();
  // });
  // tearDown(() {
  //   bloc.dispose();
  // });

  // TODO COULD TRY: extend usecase with equatable
  test("1. bloc is initialized with MOCK usecase", (){

    SideCashEnrollmentBloc bloc = SideCashEnrollmentBloc();
    expect(bloc.usecase, isA<SideCashGetEnrollmentFormUsecase>());
  });

    // view model callback is Async
  test("2. usecase is given a viewModel callback", () {

  });

  test("3: usecase callback triggers viewModelPipe.send", (){

  });

  test("3. getEnrollmentFormRequest.whenListenedTo calls usecase.create", () {});
}