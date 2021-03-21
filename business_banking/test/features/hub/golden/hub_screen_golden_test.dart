import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens(
      'golden test added to show tile to generate QR code in hub screen',
      (WidgetTester tester) async {
    await loadAppFonts();
    await tester.pumpWidgetBuilder(HubScreen(),
        surfaceSize: const Size(400, 800),
        wrapper: materialAppWrapper(
            theme: ThemeData.light(), platform: TargetPlatform.android));
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'hub_screen');
  });
}
