import 'package:business_banking/dependency/url_launcher.dart';
import 'package:business_banking/features/promos/ui/network_image_container.dart';
import 'package:business_banking/features/promos/ui/promos_presenter.dart';

import 'package:business_banking/features/promos/ui/promos_widget.dart';
import 'package:business_banking/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUrlLauncher extends Mock implements UrlLauncher {}

void main() {
  MockUrlLauncher? mockUrlLauncher;
  ExampleLocator mockExampleLocator;

  setUp(() {
    mockUrlLauncher = MockUrlLauncher();
    mockExampleLocator = ExampleLocator();
    mockExampleLocator.urlLauncher = mockUrlLauncher;
  });

  testWidgets('Promos widget has the proper elements', (tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: PromosWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.byType(PromoPresenter), findsOneWidget);
    expect(find.byType(NetworkImage), findsNothing);
  });

  testWidgets('clicking the promo will open the promo link', (tester) async {
    when(mockUrlLauncher!.launchURL(any!)).thenAnswer((_) async => true);

    final testWidget = MaterialApp(
      home: Scaffold(
        body: PromosWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(NetworkImageContainer), findsOneWidget);
    expect(find.text("There is a problem loading the image"), findsOneWidget);

    final promo = find.byKey(Key('network_image_container'));
    await tester.tap(promo);
    verify(mockUrlLauncher!.launchURL(any!)).called(1);
  });
}
