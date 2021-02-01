import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_get_enrollment_form_usecase.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class SideCashEnrollmentBloc extends Bloc {
  // Define Usecases
  SideCashEnrollmentUsecase usecase;

  // Define UI Pipes
  final enrollmentFormPipe = Pipe<EnrollmentFormViewModel>();
  final enrollmentAdvertisementPipe = Pipe<EnrollmentAdvertisementViewModel>();

  // Define Event Pipes
  final getEnrollmentFormRequest = EventPipe();
  final getEnrollmentAdvertisementRequest = EventPipe();

   SideCashEnrollmentBloc() {
    // initialize usecases and link usecase callbacks to UI Pipes
    // I think you want to inject the repository into the usecase
    usecase = SideCashEnrollmentUsecase(
      formViewModelCallBack: (viewModel) {
        enrollmentFormPipe.send(viewModel);
      },
      advertisementViewModelCallback: (viewModel) {
         enrollmentAdvertisementPipe.send(viewModel);
      },
      getRepoScope: null,
    );

    enrollmentAdvertisementPipe.whenListenedDo(getEnrollmentAdvertisementRequestListener);

    enrollmentFormPipe.whenListenedDo(getEnrollmentFormRequestListener);

    // getEnrollmentFormRequest.listen(getEnrollmentFormRequestListener);
    // getEnrollmentAdvertisementRequest
    //     .listen(getEnrollmentAdvertisementListener);
  }

  getEnrollmentFormRequestListener() {
    usecase.createForm();
  }

  getEnrollmentAdvertisementRequestListener() {
    usecase.createAdvertisement();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    enrollmentFormPipe.dispose();
    getEnrollmentFormRequest.dispose();
  }
}
