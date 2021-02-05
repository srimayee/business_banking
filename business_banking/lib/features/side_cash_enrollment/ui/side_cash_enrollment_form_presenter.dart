import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_completion_feature_widget.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_form_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SideCashEnrollmentFormPresenter extends Presenter<SideCashEnrollmentBloc,
    EnrollmentFormViewModel, SideCashEnrollmentFormScreen> {
  final Function(Function()) testUpdatedSelectedAccount;
  final Function(BuildContext, EnrollmentFormViewModel)
      testSubmitFormAndNavigate;

  SideCashEnrollmentFormPresenter(
      {this.testUpdatedSelectedAccount, this.testSubmitFormAndNavigate});

  @override
  SideCashEnrollmentFormScreen buildScreen(BuildContext context,
      SideCashEnrollmentBloc bloc, EnrollmentFormViewModel viewModel) {

    return SideCashEnrollmentFormScreen(
      formViewModel: viewModel,
      updateSelectedAccount: (String account) =>
          updateSelectedAccount(account, bloc),
      submitForm: (ctx) {
        if (testSubmitFormAndNavigate == null)
          submitFormAndNavigate(ctx, viewModel);
        else
          testSubmitFormAndNavigate(ctx, viewModel);
      },
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }

  @override
  Stream<EnrollmentFormViewModel> getViewModelStream(
      SideCashEnrollmentBloc bloc) {
    return bloc.enrollmentFormPipe.receive;
  }

  updateSelectedAccount(String accountString, SideCashEnrollmentBloc bloc) {
    print("updateSelectedAccount called in presenter");
    bloc.updateFormWithSelectedAccountPipe.send(accountString);
  }

  submitFormAndNavigate(
      BuildContext context, EnrollmentFormViewModel viewModel) {
    print("in submit form and Navigate");
    if (viewModel.selectedAccount == null) {
      print("inside if statement");
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              key: Key("enrollmentFormSubmitErrorDialog"),
              title: Text("Error"),
              content: Text("Please select an account"),
              actions: [
                FlatButton(
                  key: Key("dismissEnrollmentFormErrorDialogButton"),
                  child: Text("Okay"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
      // return;
    } else {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (ctx) => SideCashEnrollmentCompletionFeatureWidget(),
      ),
      (route) => false,
    );}
  }
}
