import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

import 'data_and_function_mocks.dart';

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
  final updateFormWithSelectedAccountEventPipe = Pipe<String>();

  MockSideCashEnrollmentBloc() {
    enrollmentFormPipe.whenListenedDo(() => enrollmentFormPipe.send(initialFormViewModel()));
    enrollmentAdvertisementPipe.whenListenedDo(() =>
      enrollmentAdvertisementPipe.send(EnrollmentAdvertisementViewModel())
    );
    enrollmentCompletionPipe.whenListenedDo(() => enrollmentCompletionPipe.send(EnrollmentCompletionViewModel()));
    updateFormWithSelectedAccountEventPipe.receive.listen(updateFormWithSelectedAccountListener);
  }

  // mockUpdateFormWithSelectedAccountListener(String account) {
  //   print("Mock mockUpdateFormWithSelectedAccountListener called in mock bloc");
  //   print("string == $account");
  // }

  @override
  void dispose() {
    enrollmentFormPipe.dispose();
    enrollmentAdvertisementPipe.dispose();
  }
}