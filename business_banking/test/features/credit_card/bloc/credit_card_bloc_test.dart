// @dart=2.9
import 'package:business_banking/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:business_banking/features/credit_card/bloc/credit_card_usecase.dart';
import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class CreditCardUseCaseMock extends Mock implements CreditCardUseCase{}

void main() {
  test('CreditCardBloc initialize', () async {
    final bloc = CreditCardBloc();
    expect(bloc.creditCardViewEventsPipe, isNotNull);
    expect(bloc.creditCardViewModelPipe, isNotNull);
    expect(bloc.creditCardPaymentRequestViewModelPipe, isNotNull);
    expect(bloc.creditCardPaymentResponseViewModelPipe, isNotNull);
  });


  test('CreditCardBloc dispose', () async {
    final bloc = CreditCardBloc();
    bloc.dispose();
    expect(bloc.creditCardViewEventsPipe.receive, emitsDone);
    expect(bloc.creditCardViewModelPipe.receive, emitsDone);
    expect(bloc.creditCardPaymentRequestViewModelPipe.receive, emitsDone);
    expect(bloc.creditCardPaymentResponseViewModelPipe.receive, emitsDone);
  });

  test('CreditCardBloc CreditCardUseCase create on pipe listen', () async {
    CreditCardUseCaseMock creditCardUseCaseMock = CreditCardUseCaseMock();
    CreditCardBloc bloc = CreditCardBloc(creditCardUseCase: creditCardUseCaseMock);
    bloc.creditCardViewModelPipe.receive.listen((event) { });
    verify(creditCardUseCaseMock.create()).called(1);
  });

}
