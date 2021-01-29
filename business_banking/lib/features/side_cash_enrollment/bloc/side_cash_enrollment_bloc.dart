import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_get_enrollment_form_usecase.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_advertisement_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class SideCashEnrollmentBloc extends Bloc {
  // Define Usecases
  SideCashGetEnrollmentFormUsecase usecase;

  // Define UI Pipes
  final enrollmentFormPipe = Pipe<EnrollmentFormViewModel>();
  final enrollmentAdvertisementPipe = Pipe<EnrollmentAdvertisementViewModel>();

  // Define Event Pipes
  final getEnrollmentFormRequest = EventPipe();
  final getEnrollmentAdvertisementRequest = EventPipe();

  SideCashEnrollmentBloc() {
    // initialize usecases and link usecase callbacks to UI Pipes
    // I think you want to inject the repository into the usecase
    usecase = SideCashGetEnrollmentFormUsecase(
      formViewModelCallBack: (viewModel) {
        enrollmentFormPipe.send(viewModel);
      },
      advertisementViewModelCallback: (viewModel) {
         enrollmentAdvertisementPipe.send(viewModel);
      },
      getRepoScope: null,
    );

    enrollmentAdvertisementPipe.whenListenedDo(() {
      usecase.createAdvertisement();
    });

    getEnrollmentFormRequest.listen(getEnrollmentFormRequestListener);
    // getEnrollmentAdvertisementRequest
    //     .listen(getEnrollmentAdvertisementListener);
  }

  // create listeners for event pipes that trigger usecase functions
  getEnrollmentFormRequestListener() {
    usecase.create(); // usecase.create()
  }

  getEnrollmentAdvertisementListener() {
    print("in getEnrollmentAdvertisementListener");
    usecase.createAdvertisement();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    enrollmentFormPipe.dispose();
    getEnrollmentFormRequest.dispose();
  }
}
