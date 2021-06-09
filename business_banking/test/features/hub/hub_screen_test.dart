// @dart=2.9
import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:business_banking/features/new_online_registration_form/ui/new_online_registration_form_entry/new_online_registration_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  MaterialApp testWidget;
  setUp(() {
    testWidget = MaterialApp(
      home: HubScreen(),
    );
  });
  tearDown(() {
    testWidget = null;
  });
  group('Create HubScreen', () {
    testWidgets('should show NewOnlineRegistrationRequestWidget',
        (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(milliseconds: 500));
      final widgetType = find.byType(NewOnlineRegistrationRequestWidget);
      expect(widgetType, findsOneWidget);
    });
  });
}
