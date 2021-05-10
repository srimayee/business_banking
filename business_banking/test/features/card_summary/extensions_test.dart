import 'package:test/test.dart';
import 'package:business_banking/features/card_usage/extensions.dart';

void main() {
  test('Word should be capitalized', () {
    final String wordToCapitalize = 'word';

    expect(wordToCapitalize.capitalize(), 'Word');
  });
}