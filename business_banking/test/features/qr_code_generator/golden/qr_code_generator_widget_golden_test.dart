import 'package:business_banking/features/qr_code_generator/model/qr_code_generator_entity.dart';
import 'package:business_banking/features/qr_code_generator/ui/qr_code_generator_widget.dart';
import 'package:business_banking/locator.dart';
import 'package:fake_async/fake_async.dart';
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

  testGoldens('golden test for QRCodeGenerator UI without expired time',
      (WidgetTester tester) async {
    FakeAsync().run((FakeAsync async) async {
      await loadAppFonts();
      DateTime date = DateTime.parse(DateTime.now().toIso8601String());
      date = date.add(Duration(seconds: 50));
      QRCodeGeneratorEntity entity = QRCodeGeneratorEntity(
        seed: '2a6abu',
        expiresAt: date.toString(),
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
  });

  testGoldens('golden test for QRCodeGenerator UI with expired time',
      (WidgetTester tester) async {
    FakeAsync().run((FakeAsync async) async {
      await loadAppFonts();
      DateTime date = DateTime.parse(DateTime.now().toIso8601String());
      date = date.subtract(Duration(seconds: 50));
      QRCodeGeneratorEntity entity = QRCodeGeneratorEntity(
        seed: '2a6abu',
        expiresAt: date.toString(),
      );

      ExampleLocator()
          .repository
          .create<QRCodeGeneratorEntity>(entity, (_) {}, deleteIfExists: true);

      await tester.pumpWidgetBuilder(QRCodeGeneratorWidget(),
          surfaceSize: const Size(500, 700),
          wrapper: materialAppWrapper(
              theme: ThemeData.light(), platform: TargetPlatform.android));
      await tester.pumpAndSettle();
      await screenMatchesGolden(tester, 'qr_code_generated_expired');
    });
  });
}
