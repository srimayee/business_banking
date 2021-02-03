import 'package:flutter/material.dart';

class SideCashEnrollmentWidgetKeys {
  static final sideCashEnrollButton =
      Key(SideCashEnrollmentWidgetKeyStrings.enrollButtonKeyString);
  static final sideCashEnrollAdvertisementHeader = Key(
      SideCashEnrollmentWidgetKeyStrings.enrollAdvertisementHeaderKeyString);

  static final selectedAccountText =
      Key(SideCashEnrollmentWidgetKeyStrings.selectedAccountTextKeyString);

  static final sideCashEnrollmentFormScaffold = Key(
      SideCashEnrollmentWidgetKeyStrings
          .enrollmentFormScaffoldKeyString);

  static final sideCashFormSubmitButton =
      Key(SideCashEnrollmentWidgetKeyStrings.formSubmitButtonKeyString);

  static final exitEnrollmentFeatureButton = Key(
      SideCashEnrollmentWidgetKeyStrings.exitEnrollmentFeatureButtonKeyString);
  static final enrollmentCompletionScaffold = Key(
      SideCashEnrollmentWidgetKeyStrings.enrollmentCompletionScaffoldKeyString);
  static final enrollmentCompletionAppBarText = Key("enrollmentCompletionAppBarText");
  static final successBooleanMessage =
      Key(SideCashEnrollmentWidgetKeyStrings.successBooleanMessageKeyString);
  static final completionMessage =
      Key(SideCashEnrollmentWidgetKeyStrings.completionMessageKeyString);
}

class SideCashEnrollmentWidgetKeyStrings {
  static final enrollButtonKeyString = 'sideCashEnrollButton';
  static final enrollAdvertisementHeaderKeyString =
      "sideCashEnrollAdvertisementHeader";

  static final selectedAccountTextKeyString = "selectedAccountText";

  static final enrollmentFormScaffoldKeyString =
      'enrollmentFormScaffold';

  static final formSubmitButtonKeyString = 'formSubmitButton';

  static final exitEnrollmentFeatureButtonKeyString =
      "exitEnrollmentFeatureButton";
  static final enrollmentCompletionScaffoldKeyString =
      "enrollmentCompletionScaffold";
  static final successBooleanMessageKeyString = "successBooleanMessage";
  static final completionMessageKeyString = "completionMessage";
}
