import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_entity.dart';
import 'package:business_banking/features/qr_code_generator/ui/qr_code_generator_widget.dart';
import 'package:business_banking/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('golden test for QRCodeGenerator service failure',
      (WidgetTester tester) async {
    await loadAppFonts();
    await tester.pumpWidgetBuilder(QRCodeGeneratorWidget(),
        surfaceSize: const Size(500, 700),
        wrapper: materialAppWrapper(
            theme: ThemeData.light(), platform: TargetPlatform.android));
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'qr_code_failure');
  });

  testGoldens('golden test for QRCodeGenerator UI',
      (WidgetTester tester) async {
    //Running this test using flutter test will fail because of time gap of timer between
    //2080-02-18T23:42:30.802 and DateTime.now() of timer.Used to show golden widget generated.
    await loadAppFonts();
    QRCodeGeneratorEntity entity = QRCodeGeneratorEntity(
      seed: '2a6abu',
      expiresAt: '2080-02-18T23:42:30.802Z',
    );

    ExampleLocator()
        .repository
        .create<QRCodeGeneratorEntity>(entity, (_) {}, deleteIfExists: true);

    await tester.pumpWidgetBuilder(QRCodeGeneratorWidget(),
        surfaceSize: const Size(500, 700),
        wrapper: materialAppWrapper(
            theme: ThemeData.light(), platform: TargetPlatform.android));
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'qr_code_generated');
  });
}
