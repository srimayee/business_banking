// @dart=2.9

import 'package:business_banking/features/online_registration/bloc/online_registration_form_entry/online_registration_event.dart';
import 'package:test/test.dart';

void main() {
  group('Online Registration Event', () {
    test(
        'should props match and stringify be true on UpdateCardHolderNameEvent',
        () {
      final event = UpdateCardHolderNameEvent('Tyler');
      expect(event.props, ['Tyler']);
      expect(event.stringify, true);
    });
    test('should props match and stringify be true on UpdateCardNumberEvent',
        () {
      final event = UpdateCardNumberEvent('379260567141018');
      expect(event.props, ['379260567141018']);
      expect(event.stringify, true);
    });

    test(
        'should props match and stringify be true on UpdateSSNLastFourDigitsEvent',
        () {
      final event = UpdateSSNLastFourDigitsEvent('5346');
      expect(event.props, ['5346']);
      expect(event.stringify, true);
    });

    test('should props match and stringify be true on UpdateUserEmailEvent',
        () {
      final event = UpdateUserEmailEvent('test@test.com');
      expect(event.props, ['test@test.com']);
      expect(event.stringify, true);
    });

    test('should props match and stringify be true on UpdateUserPasswordEvent',
        () {
      final event = UpdateUserPasswordEvent('Test123test');
      expect(event.props, ['Test123test']);
      expect(event.stringify, true);
    });

    test('should props match and stringify be true on SubmitDepositCheckEvent',
        () {
      final event = SubmitOnlineRegistrationEvent();
      expect(event.props, []);
      expect(event.stringify, true);
    });
  });
}
