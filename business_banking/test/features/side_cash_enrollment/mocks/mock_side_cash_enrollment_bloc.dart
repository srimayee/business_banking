import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class MockSideCashEnrollmentBloc extends Mock implements SideCashEnrollmentBloc {
  // final viewModelPipe = Pipe<BillPayViewModel>();
  // final myPayeeViewModelPipe = Pipe<MyPayeeViewModel>();
  // final scheduledPaymentsViewModelPipe = Pipe<ScheduledPaymentsByMonthViewModel>();




  // Define Usecases
  // SideCashEnrollmentUsecase usecase;

  // Define UI Pipes
  final enrollmentFormPipe = Pipe<EnrollmentFormViewModel>();
  final enrollmentAdvertisementPipe = Pipe<EnrollmentAdvertisementViewModel>();

  // Define Event Pipes
  final getEnrollmentFormRequest = EventPipe();
  final getEnrollmentAdvertisementRequest = EventPipe();


  MockSideCashEnrollmentBloc() {
    enrollmentFormPipe.whenListenedDo(() => enrollmentFormPipe.send(EnrollmentFormViewModel()));
    enrollmentAdvertisementPipe.whenListenedDo(() =>
      enrollmentAdvertisementPipe.send(EnrollmentAdvertisementViewModel())
    );
  }
  @override
  void dispose() {
    enrollmentFormPipe.dispose();
    enrollmentAdvertisementPipe.dispose();
  }
}