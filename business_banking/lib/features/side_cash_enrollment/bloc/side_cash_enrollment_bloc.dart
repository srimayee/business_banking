import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_usecase.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class SideCashEnrollmentBloc extends Bloc {
  // Define Usecases
  SideCashEnrollmentUsecase usecase;

  // Define UI Pipes
  final enrollmentFormPipe = Pipe<EnrollmentFormViewModel>();
  final enrollmentAdvertisementPipe = Pipe<EnrollmentAdvertisementViewModel>();
  final enrollmentCompletionPipe = Pipe<EnrollmentCompletionViewModel>();

  final updateFormWithSelectedAccountPipe = Pipe<String>();
  // final submitFormEventPipe = EventPipe();

   SideCashEnrollmentBloc({SideCashEnrollmentUsecase testUseCase}) {
    // initialize usecases and link usecase callbacks to UI Pipes
    // I think you want to inject the repository into the usecase
     print("test usecase == null ${testUseCase == null}");
    usecase = testUseCase ?? SideCashEnrollmentUsecase(
      formViewModelCallBack: (viewModel) {
        enrollmentFormPipe.send(viewModel);
      },
      advertisementViewModelCallback: (viewModel) {
         enrollmentAdvertisementPipe.send(viewModel);
      },
      completionViewModelCallback: (viewModel) {
        enrollmentCompletionPipe.send(viewModel);
      }
    );

    enrollmentAdvertisementPipe.whenListenedDo(getEnrollmentAdvertisementRequestListener);

    enrollmentFormPipe.whenListenedDo(getEnrollmentFormRequestListener);

    updateFormWithSelectedAccountPipe.receive.listen(updateFormWithSelectedAccountListener);
    // submitFormEventPipe.receive.listen((event) { });

     enrollmentCompletionPipe.whenListenedDo(submitForm);
  }

  getEnrollmentFormRequestListener() {
    usecase.createForm();
  }

  getEnrollmentAdvertisementRequestListener() {
    usecase.createAdvertisement();
  }

  updateFormWithSelectedAccountListener(String account) {
     print("updateFormWithSelectedAccountListener called in bloc");
     usecase.updateFormWithSelectedAccount(account);
  }

  void submitForm(){
     usecase.submitEnrollmentForm();
  }

  @override
  void dispose() {
    enrollmentFormPipe.dispose();
    enrollmentAdvertisementPipe.dispose();
  }
}
