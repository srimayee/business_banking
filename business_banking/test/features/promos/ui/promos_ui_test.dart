import 'package:business_banking/features/promos/ui/promos_presenter.dart';
import 'package:business_banking/features/promos/ui/promos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../util/image_test_util.dart';

void main() {
  testWidgets('Promos widget has the proper elements', (tester) async {
    //In widget tests, the default HTTP client has been replaced with one that always returns 400s.
    //use this utility to return dummy image for testing
    //https://github.com/flutter/flutter_markdown/blob/a2fa53b7a29dc58b6f26b53e23a6f5a8d283dd66/test/flutter_markdown_test.dart#L506-L548
    provideMockedNetworkImages(() async {
      final testWidget = MaterialApp(
        home: Scaffold(
          body: PromosWidget(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(milliseconds: 500));

      expect(find.byType(PromoPresenter), findsOneWidget);
    });
  });
}
