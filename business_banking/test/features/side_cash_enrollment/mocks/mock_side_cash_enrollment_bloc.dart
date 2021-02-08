import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

import 'data_and_function_mocks.dart';

class MockedStream extends Mock implements Stream<String> {}

class MockStringPipe extends Mock implements Pipe<String>{

  @override
  // TODO: implement receive
  Stream<String> get receive => MockedStream();
}

class MockSideCashEnrollmentBloc extends Mock implements SideCashEnrollmentBloc {
  // final viewModelPipe = Pipe<BillPayViewModel>();
  // final myPayeeViewModelPipe = Pipe<MyPayeeViewModel>();
  // final scheduledPaymentsViewModelPipe = Pipe<ScheduledPaymentsByMonthViewModel>();




  // Define Usecases
  // SideCashEnrollmentUsecase usecase;

  // Define UI Pipes
  final enrollmentFormPipe = Pipe<EnrollmentFormViewModel>();
  final enrollmentAdvertisementPipe = Pipe<EnrollmentAdvertisementViewModel>();
  final enrollmentCompletionPipe = Pipe<EnrollmentCompletionViewModel>();
  final updateFormWithSelectedAccountPipe = MockStringPipe();

  MockSideCashEnrollmentBloc() {
    enrollmentFormPipe.whenListenedDo(() => enrollmentFormPipe.send(initialFormViewModel()));
    enrollmentAdvertisementPipe.whenListenedDo(() =>
      enrollmentAdvertisementPipe.send(EnrollmentAdvertisementViewModel())
    );
    enrollmentCompletionPipe.whenListenedDo(() => enrollmentCompletionPipe.send(EnrollmentCompletionViewModel()));
    updateFormWithSelectedAccountPipe.receive.listen(updateFormWithSelectedAccountListener);


    // TODO try whenListenDO
    // updateFormWithSelectedAccountPipe.whenListenedDo(() => updateFormWithSelectedAccountListener);

  }

  @override
  void dispose() {
    enrollmentFormPipe.dispose();
    enrollmentAdvertisementPipe.dispose();
    enrollmentCompletionPipe.dispose();
    updateFormWithSelectedAccountPipe.dispose();
    // TODO dispose pipes

  }
}