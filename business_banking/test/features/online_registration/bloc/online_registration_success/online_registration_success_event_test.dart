// @dart=2.9
import 'package:business_banking/features/online_registration/bloc/online_registration_success/online_registration_success_event.dart';
import 'package:test/test.dart';

void main() {
  group('Online registration Confirm Event', () {
    test(
        'should props match and stringify be true on ResetOnlineRegistrationViewModelEvent',
        () {
      final event = ResetOnlineRegistrationViewModelEvent();
      expect(event.props, []);
      expect(event.stringify, true);
    });
    test('should props match and stringify be true on ResetServiceStatusEvent',
        () {
      final event = ResetServiceStatusEvent();
      expect(event.props, []);
      expect(event.stringify, true);
    });
  });
}
