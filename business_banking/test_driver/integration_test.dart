// @dart = 2.9
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'integration_test_helpers.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Banking App Integration Tests:', () {
    final signInText = 'signInText';
    final loginButton = 'login_button_key';

    // hub
    final hubAppBar = find.byKey(Key('CAappBarName'));

    // Cash Accounts - Detail
    final backButton = find.byKey(Key('backButton'));

    // Customer - Tile
    final customerTileText = find.byKey(Key('HCTileText'));
    final customerTileButton = 'HCTileButton';

    // Customer - Detail
    final customerDetailAppBar = find.byKey(Key('HCDappBarName'));
    final customerDetailName = find.byKey(Key('HCDname'));
    final customerDetailAddress = find.byKey(Key('HCDaddress'));
    final customerBackButton = find.bySemanticsLabel("Back");

    /// These will only pass with the specific JSON included in the Mockoon folder
    testWidgets('Integration test', (WidgetTester tester) async {
      await startTest(tester);

      //LoginScreen, screen is displayed
      await didWidgetAppear(signInText);
      await didTextAppear('Sign In');

      //navigated to and app bar is displayed
      await tapWidget(loginButton);
      expect(tester.widget<Text>(hubAppBar).data, 'Business Banking');

      //CashAccountsDetailScreen, back to hub
      await tapWithFinder(backButton);

      //CustomerScreen, Hello Joe is displayed on tile
      expect(tester.widget<Text>(customerTileText).data, 'Hello Mr. Joe A');

      //CustomerDetailScreen, navigate to and app bar is displayed
      await tapWidget(customerTileButton);
      expect(tester.widget<Text>(customerDetailAppBar).data, 'Hello Customer');

      //CustomerDetailScreen, name address is displayed on screen
      expect(tester.widget<Text>(customerDetailName).data, 'Hello Mr. Joe A');
      expect(tester.widget<Text>(customerDetailAddress).data,
          '1234 ABCD Rd, City, State 00000');

      //CustomerScreen, check to find correct app bar
      await tapWithFinder(customerBackButton);
    });
  });
}
