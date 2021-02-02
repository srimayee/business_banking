

import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_form_feature_widget.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_form_presenter.dart';
import 'package:flutter_test/flutter_test.dart';

main() {

  group("side cash enrollment feature widget tests", () {

    // create Mock bloc and tear down in set up and create



    testWidgets("BuildWhenAvailable will create a presenter ", (tester) async {
      final widget = SideCashEnrollmentFormFeatureWidget();
      await tester.pumpWidget(widget);
      expect(find.byType(SideCashEnrollmentFormPresenter), findsOneWidget);

    });

    testWidgets("BuildWhenAvailable will NOT create a presenter when feature flag is disabled", (tester) {

    });


  });


}