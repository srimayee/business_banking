import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';
import 'package:hnb_flutter_ui/src/ui/check_box/check_box.dart';
import 'package:hnb_flutter_ui/src/ui/text_regular/text_regular.dart';

void main() {
  testWidgets('Check Box widget should render properly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CheckBoxHNB(
        content: 'save',
        onTap: () {},
      ),
    ));

    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);
    expect(find.byKey(const Key('check-box')), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(TextRegularHNB), findsOneWidget);
  });
}
