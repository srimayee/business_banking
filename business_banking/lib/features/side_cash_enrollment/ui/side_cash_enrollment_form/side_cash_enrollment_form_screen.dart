import 'package:business_banking/features/side_cash_enrollment/model/enrollment_form_view_model.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_keys.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SideCashEnrollmentFormScreen extends Screen {
  final EnrollmentFormViewModel formViewModel;
  final Function(String) updateSelectedAccount;

  SideCashEnrollmentFormScreen({
    @required this.formViewModel,
    @required this.updateSelectedAccount,
  }) : assert(formViewModel != null && updateSelectedAccount != null);

  _buildAccountRadioButtons() {
    List<Widget> accountButtonSelectors = [];
    formViewModel.accounts.forEach((accountString) {
      accountButtonSelectors.add(RadioListTile<String>(
          title: Text(accountString),
          key: Key("account-$accountString"),
          value: accountString,
          groupValue: formViewModel.selectedAccount,
          onChanged: (selectedAccount) {
            updateSelectedAccount(selectedAccount);
          }));
    });
    return accountButtonSelectors;
  }

  @override
  Widget build(BuildContext context) {

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
                  key: SideCashEnrollmentWidgetKeys.sideCashEnrollButton,
                  child: Text("Enroll"),
                  onPressed: () {},
                ),
              )
            ],
          ),
          //     child: Text("gasdawga")
        ));
  }
}
