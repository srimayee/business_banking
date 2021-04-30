// @dart=2.9
import 'package:business_banking/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:business_banking/features/credit_card/ui/credit_card_details/credit_card_details_presenter.dart';
import 'package:business_banking/features/credit_card/ui/credit_card_details/credit_card_details_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CreditCardBlocMock extends Mock implements CreditCardBloc {}

void main() {

  CreditCardBlocMock bloc;
  CreditCardDetailsPresenter presenter;
  Widget testWidget;

  setUp(() {
    bloc = CreditCardBlocMock();
    presenter = CreditCardDetailsPresenter();
    testWidget = MaterialApp(
      home: BlocProvider<CreditCardBloc>(
        create: (_) => bloc,
        child: presenter,
      ),
    );
  });

  tearDown(() {
    bloc = null;
    testWidget = null;
  });

  /*
  testWidgets('CreditCardPresenter initialization', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(CreditCardDetailsScreen), findsOneWidget);
  });
  */

}
