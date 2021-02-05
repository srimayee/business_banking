import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/side_cash_enrollment_keys.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SideCashEnrollmentFormScreen extends Screen {
  final EnrollmentFormViewModel formViewModel;
  final Function(String) updateSelectedAccount;
  final Function(BuildContext) submitForm;

  SideCashEnrollmentFormScreen({
    @required this.formViewModel,
    @required this.updateSelectedAccount,
    @required this.submitForm,
  }) : assert(formViewModel != null &&
            updateSelectedAccount != null &&
            submitForm != null);

  List<Widget> _buildAccountRadioButtons() {
    List<Widget> accountButtonSelectors = [];
    for (String account in formViewModel.accounts) {
      accountButtonSelectors.add(
        RadioListTile<String>(
            title: Text(account),
            key: Key("side_cash_account_radio_button-$account"),
            value: account,
            groupValue: formViewModel.selectedAccount,
            onChanged: (selectedAccount) {
              updateSelectedAccount(selectedAccount);
            }),
      );
    }
    return accountButtonSelectors;
  }

  @override
  Widget build(BuildContext context) {
    print("in form screen build method");
    return Scaffold(
        key: SideCashEnrollmentWidgetKeys.sideCashEnrollmentFormScaffold,
        appBar: AppBar(
          title: Text("Form Registration"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ..._buildAccountRadioButtons(),
              Expanded(
                child: Container(),
              ),
              Center(
                child: RaisedButton(
                  key: SideCashEnrollmentWidgetKeys.sideCashFormSubmitButton,
                  child: Text("Enroll"),
                  onPressed: () {
                    return submitForm(context);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
