import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_completion_feature_widget.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_completion_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_side_cash_enrollment_bloc.dart';

main() {

  testWidgets("BuildWhenAvailable will create a presenter ", (tester) async {

    final widget = MaterialApp(home:  SideCashEnrollmentCompletionFeatureWidget(bloc: MockSideCashEnrollmentBloc(),));
    await tester.pumpWidget(widget);
    expect(find.byType(SideCashEnrollmentCompletionPresenter), findsOneWidget);


  });
}