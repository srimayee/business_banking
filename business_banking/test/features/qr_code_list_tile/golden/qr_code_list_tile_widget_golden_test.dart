import 'package:business_banking/features/qr_code_list_tile/ui/qr_code_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('golden test added to show tile to generate QR code',
      (WidgetTester tester) async {
    await loadAppFonts();
    await tester.pumpWidgetBuilder(QRCodeListTileWidget(),
        surfaceSize: const Size(400, 300),
        wrapper: materialAppWrapper(
            theme: ThemeData.light(), platform: TargetPlatform.android));
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'qr_code_list_tile');
  });
}
