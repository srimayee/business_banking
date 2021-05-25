// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'integration_test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      "After user tap on Deposit Check feature, go to the Deposit Check data entry page which contains the details of account"
      ", then navigate back to the hub page", (WidgetTester tester) async {
    await startTest(tester);
    await didWidgetAppear('signInText');
    await tapWidget('login_button_key');
    // hub
    final hubAppBar = find.byKey(Key('CAappBarName'));
    expect(tester.widget<Text>(hubAppBar).data, 'Business Banking');

    //Investment Accounts Screen, displaying Card Data
    await didWidgetAppear('Deposit-Check-Card-Succeed');
    // await didTextAppear('Investment Account Balance');
    // await didTextAppear('Account value / Today\'s net change');

    await tapWidget('Deposit-Check-Card-Succeed');
    //await didTextAppear('Account Balance');

    await didWidgetAppear('item-list-key');

    final gesture =
        await tester.startGesture(Offset(0, 300)); //Position of the scrollview
    await gesture.moveBy(Offset(0, -200)); //How much to scroll by

    //final backButton = find.byKey(Key('investment-detail-backButton'));

    // await tapWithFinder(backButton);

    await tester.pumpAndSettle();

    // expect(backButton, findsNothing);
  });

  //testWidgets('description', (WidgetTester tester) async {});
}
