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
    await didWidgetAppear('cardHolderName-TxtField');
    await didWidgetAppear('cardHolderNumber-TxtField');
    await didWidgetAppear('userEmailAddress-TxtField');
    await didWidgetAppear('userPassword-TxtField');
    await didWidgetAppear('createButton');
    await tapWidget('createButton');
    await didTextAppear('Invalid Information!');
    await didTextAppear('Please fill in all fields properly');
    await didTextAppear('OK');
    await tapText('OK');
    await tapWidget('cardHolderName-TxtField');
    await enterText('cardHolderName-TxtField','Test');
    await tapWidget('createButton');
    await didWidgetNeverAppear('Please provide valid name.');
    await tapText('OK');
    await tapWidget('cardHolderName-TxtField');
    await enterText('cardHolderName-TxtField','1234');
    await tapWidget('createButton');
    await didTextAppear('Please provide valid name.');
    await tapText('OK');
    await tapWidget('cardHolderNumber-TxtField');
    await enterText('cardHolderNumber-TxtField','1234');
    await tapWidget('createButton');
    await didTextAppear('Please provide valid credit card Number.');
    await tapText('OK');
    await tapWidget('cardHolderNumber-TxtField');
    await enterText('cardHolderNumber-TxtField','1234567890123456789');
    await didWidgetNeverAppear('Please provide valid credit card Number.');
    await tapWidget('createButton');
    await didTextAppear('OK');

    // await tapWidget('userPassword-TxtField');
    // await enterText('userPassword-TxtField','test');
    // await tapWidget('createButton');
    // await didTextAppear('Please, provide a valid email.');
    // await tapWidget('userPassword-TxtField');
    // await enterText('userPassword-TxtField','Test123test');
    // await didWidgetNeverAppear('Please, provide a valid email.');
    // await tapWidget('createButton');
    // await didTextAppear('OK');

    // await tapWidget('userEmailAddress-TxtField');
    // await enterText('userEmailAddress-TxtField','test');
    // await tapWidget('createButton');
    // await didTextAppear('Please, provide a valid email.');
    // await tapWidget('userEmailAddress-TxtField');
    // await enterText('userEmailAddress-TxtField','Test@test.com');
    // await didWidgetNeverAppear('Please, provide a valid email.');
    // await tapWidget('createButton');
    // await didTextAppear('OK');


    // await didTextAppear('Account value / Today\'s net change');

    // await tapWidget('Deposit-Check-Card-Succeed');
    // //await didTextAppear('Account Balance');
    //
    // await didWidgetAppear('item-list-key');
    //
    // final gesture =
    // await tester.startGesture(Offset(0, 300)); //Position of the scrollview
    // await gesture.moveBy(Offset(0, -200)); //How much to scroll by
    //
    // //final backButton = find.byKey(Key('investment-detail-backButton'));
    //
    // // await tapWithFinder(backButton);
    //
    // await tester.pumpAndSettle();

    // expect(backButton, findsNothing);
  });

  //testWidgets('description', (WidgetTester tester) async {});
}
