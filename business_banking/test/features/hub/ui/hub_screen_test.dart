import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:business_banking/features/qr_code_list_tile/ui/qr_code_list_tile_widget.dart';
import 'package:business_banking/features/quickpay/ui/quickpay_widget.dart';
import 'package:business_banking/features/transfer_funds/ui/transfer_card.dart';
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

  testWidgets('Test QRCode list tile on load of hub screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        HubScreen(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Business Banking'), findsOneWidget);
    expect(find.byType(TransferFundsCard), findsOneWidget);
    expect(find.byType(QuickPayWidget), findsOneWidget);
    expect(find.byType(QRCodeListTileWidget), findsOneWidget);
    expect(find.text('QRCode'), findsOneWidget);
    expect(find.text('Generate'), findsOneWidget);
  });
}
