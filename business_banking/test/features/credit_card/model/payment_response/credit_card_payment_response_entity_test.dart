import 'package:business_banking/features/credit_card/model/payment_response/credit_card_payment_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardPaymentResponseEntity initialize with null values', () async {
    final entity = CreditCardPaymentResponseEntity();
    expect(entity.number, '');
    expect(entity.name, '');
    expect(entity.lastFour, '');
    expect(entity.paymentValue, 0.00);
    expect(entity.paymentStatus, 'Processing');
    expect(entity.reasonRejected, '');
    expect(entity.props, [
      entity.errors,
      entity.number,
      entity.name,
      entity.lastFour,
      entity.paymentValue,
      entity.paymentStatus,
      entity.reasonRejected,
    ]);
  });

  test('CreditCardPaymentResponseEntity initialize with real values', () async {
    final entity = CreditCardPaymentResponseEntity(
      number: '1111222233334444',
      name: 'My Credit Card',
      lastFour: '4444',
      paymentValue: 100.00,
      paymentStatus: "Rejected",
      reasonRejected: 'Tests!',
    );
    expect(entity.number, '1111222233334444');
    expect(entity.name, 'My Credit Card');
    expect(entity.lastFour, '4444');
    expect(entity.paymentValue, 100.00);
    expect(entity.paymentStatus, "Rejected");
    expect(entity.reasonRejected, 'Tests!');
    expect(entity.props, [
      entity.errors,
      entity.number,
      entity.name,
      entity.lastFour,
      entity.paymentValue,
      entity.paymentStatus,
      entity.reasonRejected,
    ]);
  });

  test('CreditCardPaymentResponseEntity merge', () async {
    CreditCardPaymentResponseEntity entity = CreditCardPaymentResponseEntity(
      number: '1111222233334444',
      name: 'My Credit Card',
      lastFour: '4444',
      paymentValue: 100.00,
      paymentStatus: "Rejected",
      reasonRejected: 'Tests!',
    );

    var entity2 = entity.merge(
        number: "5555666677778888",
        name: "Name2",
        lastFour: "8888",
        paymentValue: 200.00,
        paymentStatus: "Success",
        reasonRejected: '') as CreditCardPaymentResponseEntity;

    expect(entity2.number, "5555666677778888");
    expect(entity2.name, "Name2");
    expect(entity2.lastFour, "8888");
    expect(entity2.paymentValue, 200.00);
    expect(entity2.paymentStatus, "Success");
    expect(entity2.reasonRejected, '');
  });
}
