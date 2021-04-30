// @dart=2.9

import 'package:business_banking/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:business_banking/features/credit_card/ui/credit_card/credit_card_presenter.dart';
import 'package:business_banking/features/credit_card/ui/credit_card/credit_card_screen.dart';
import 'package:business_banking/features/credit_card/ui/credit_card/credit_card_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {

  Widget testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: CreditCardWidget(),
    );
  });

  tearDown(() {
    testWidget = null;
  });


  testWidgets('CreditCardWidget initialization', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(CreditCardWidget), findsOneWidget);
  });

}
