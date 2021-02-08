

import 'integration_test_helpers.dart';
import 'side_cash_enrollment_keys.dart';

navigateToRegistration()async {
  await didTextAppear("Sign Up for Side Cash!");
  await tapWidget(advertisememntTapToEnrollButtonKey);
  await didWidgetAppear(formRegistrationScaffoldKey);
}

fillAndSubmitForm() async {
  await tapWidget(checkingRadioTileKey);
  await tapWidget(submitButtonKey);
  await didWidgetAppear(registrationCompleteScaffoldKey);
}


submitWithNoData () async {
  await tapWidget(submitButtonKey);
  await didWidgetAppear(alertDialogKey);
  await tapWidget(dismissButtonKey);
  await didWidgetNeverAppear(alertDialogKey);
}

exitRegistration() async {
  await tapWidget(exitRegistrationButtonKey);
  await didWidgetAppear(hubAppBarTextKey);
}