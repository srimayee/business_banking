import 'package:business_banking/features/online_registration/ui/online_registration_form_entry/online_registration_presenter.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_form_entry/online_registration_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MaterialApp(
      home: widget,
    );
  }

  testWidgets('OnlineRegistration Widget loaded successfully!',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(OnlineRegistrationFeatureWidget()));
    await tester.pumpAndSettle();
    expect(find.byType(OnlineRegistrationPresenter), findsOneWidget);
  });
}
