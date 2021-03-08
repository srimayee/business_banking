import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'integration_test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      "After user tap on investment account, go to the investment detail page which contains the details of investment account"
      "and then navigate back to the hub page", (WidgetTester tester) async {
    await startTest(tester);
    await didWidgetAppear('signInText');
    await tapWidget('login_button_key');
    // hub
    final hubAppBar = find.byKey(Key('CAappBarName'));
    expect(tester.widget<Text>(hubAppBar).data, 'Business Banking');

    //Investment Accounts Screen, displaying Card Data
    await didWidgetAppear('investmentCard');

    //CashAccountsDetailScreen, navigate to and app bar is displayed
    await tapWidget('investmentCard');
    // final accountDetailAppBar = find.byKey(Key('ADappBarL4'));
//await didTextAppear('Investment Account Balance');
    //await didTextAppear('Account value / Today\'s net change');
    await didTextAppear('\$169235.24');
    await didTextAppear('\$-47000.16 (3.88%)');
    // expect(tester.widget<Text>(accountDetailAppBar).data, '*6542');

//CashAccountsDetailScreen, beginBalance pendingTransactions depositHolds balance type routingNum is displayed on screen
    await didTextAppear("Account Balance");
    // await didTextAppear("-\$128.89");
    // expect(tester.widget<Text>(depHold).data, "\$0.00");
    // expect(tester.widget<Text>(bigBalance).data, "\$3545.54");
    // await didTextAppear("Account Type: Employee Checking");
    // await didTextAppear("Routing Number: 746395735");

    //CashAccountsDetailScreen, back to hub
    final backButton = find.byKey(Key('InvestmentDetailBackButton'));

    await tapWithFinder(backButton);

    await tester.pumpAndSettle();
  });

  //testWidgets('description', (WidgetTester tester) async {});
}
