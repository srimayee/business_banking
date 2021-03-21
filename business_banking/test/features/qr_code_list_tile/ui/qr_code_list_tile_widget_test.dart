import 'package:business_banking/features/qr_code_generator/api/qr_code_generator_service.dart';
import 'package:business_banking/features/qr_code_list_tile/ui/qr_code_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: widget,
        ));
  }

  testWidgets('Test QRCode list tile with text and button',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        QRCodeListTileWidget(),
      ),
    );
    await tester.pump();
    expect(find.text('QRCode'), findsOneWidget);
    expect(find.text('Generate'), findsOneWidget);
  });

  testWidgets('Test tap action of generate button',
      (WidgetTester tester) async {
    QRCodeGeneratorService.mockService = true;
    await tester.pumpWidget(
      buildTestableWidget(
        QRCodeListTileWidget(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('QRCode'), findsOneWidget);
    expect(find.text('Generate'), findsOneWidget);
    await tester.tap(find.text('Generate'));
    await tester.pumpAndSettle();
    expect(find.text('Generate'), findsNothing);
    expect(find.text('QRCode'), findsNothing);
  });
}
