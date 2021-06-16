import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

const String usernameField = 'username';
const String passwordField = 'password';
const String _helperName = 'Integration test helper';
WidgetTester? _tester;
Future<void> startTest(WidgetTester tester) async {
  _tester = tester;

  main();
  await tester.pumpAndSettle();
  _log('$_helperName: startTest!');
}

Future<void> attemptLogin(String username, String password) async {
  await waitFor(find.text(username));
  await tapWidgetWithKey(usernameField);
  await enterTextWithKey('username', username);
  await waitFor(find.text(username));
  await tapWidgetWithKey(passwordField);
  await enterTextWithKey('password', password);
  await waitFor(find.text(password));
  print('participant is logging into their account');
  await tapWidgetWithKey('login');
  await waitForAbsentWidgetKey('loader');
  print('participant is logged into their account');
}

Future<bool> waitFor(Finder finder,
    {Duration timeout = const Duration(seconds: 1),
    Matcher matcher = findsWidgets}) async {
  final DateTime endTime = DateTime.now().add(timeout);
  do {
    if (DateTime.now().isAfter(endTime)) {
      return false;
    }
    await _tester!!.pumpAndSettle();
  } while (!await _expect(finder, matcher));
  return true;
}

Future<void> didWidgetAppear(String widgetKey) async {
  final Finder finder = find.byKey(Key(widgetKey));
  await waitFor(finder);
  expect(finder, findsWidgets);
  _log('$_helperName: didWidgetAppear: $widgetKey');
}

Future<void> didTextAppear(String text) async {
  final Finder finder = find.text(text);
  await waitFor(finder);
  expect(finder, findsWidgets);
  _log('$_helperName: didTextAppear: $text');
}

Future<void> tapWidgetWithKey(String widgetKey) async {
  final Finder finder = find.byKey(Key(widgetKey));
  await _tap(finder);
  _log('$_helperName: tapWidget: $widgetKey');
}

Future<void> tapText(String text) async {
  final Finder finder = find.text(text);
  await _tap(finder);
  _log('$_helperName: tapText: $text');
}

Future<void> tapWithFinder(Finder finder) async {
  await _tap(finder);
  _log('$_helperName: tapWithFinder: $finder');
}

Future<void> _tap(Finder finder) async {
  await waitFor(finder);
  await _tester!.tap(finder.first);
  await _tester!.pumpAndSettle();
}

Future<void> waitForAbsentWidgetKey(String widgetKey) async {
  final Finder finder = find.byKey(Key(widgetKey));

  final DateTime endTime = DateTime.now().add(const Duration(seconds: 1));
  do {
    await _tester!.pumpAndSettle();
  } while (!DateTime.now().isAfter(endTime));

  expect(finder, findsNothing);
  _log('$_helperName: waitForAbsentWidgetKey: $widgetKey');
}

Future<void> waitForAbsent(Finder finder) async {
  final DateTime endTime = DateTime.now().add(const Duration(seconds: 1));
  do {
    await _tester!.pumpAndSettle();
  } while (!DateTime.now().isAfter(endTime));

  expect(finder, findsNothing);
  _log('$_helperName: waitForAbsent: $finder');
}

Future<void> enterTextWithKey(String widgetKey, String text) async {
  final Finder finder = find.byKey(Key(widgetKey));
  await waitFor(finder);
  await _tester!.enterText(finder.first, text);
  await _tester!.pumpAndSettle();
  _log('$_helperName: enterTextWithKey: $text widget: $widgetKey');
}

Future<void> scrollToWidget(String widgetKey,
    {required double deltaY, required String scrollableWidgetKey}) async {
  final Finder finder = find.byKey(Key(widgetKey));
  await _scrollTo(finder,
      deltaY: deltaY, scrollableWidgetKey: scrollableWidgetKey);
  _log('$_helperName: scrollToWidget: $widgetKey deltaY: $deltaY');
}

Future<void> scrollToText(String text,
    {required double deltaY, required String scrollableWidgetKey}) async {
  final Finder finder = find.text(text);
  await _scrollTo(finder,
      deltaY: deltaY, scrollableWidgetKey: scrollableWidgetKey);
  _log('$_helperName: scrollToText: $text deltaY: $deltaY');
}

Future<void> _scrollTo(Finder finder,
    {required double deltaY, String? scrollableWidgetKey}) async {
  final Finder scrollFinder = scrollableWidgetKey != null
      ? find.byKey(Key(scrollableWidgetKey))
      : find.byWidgetPredicate((Widget widget) =>
          widget is SingleChildScrollView || widget is ScrollView);
  await _tester!.scrollUntilVisible(finder.first, deltaY ?? 100,
      scrollable: find
          .descendant(of: scrollFinder, matching: find.byType(Scrollable))
          .first);
  await _tester!.pumpAndSettle();
}

Future<void> scrollUntilVisible(Finder finder) async {
  await _tester!.ensureVisible(finder);
  await _tester!.pumpAndSettle();
}

Future<void> selectDropDownList(
    String dropDownButtonKey, String optionText) async {
  await _tap(find.byKey(Key(dropDownButtonKey)));
  final Finder finder = find.descendant(
      of: find.byType(Scrollable).last, matching: find.text(optionText));
  await _tester!.scrollUntilVisible(finder, 100,
      scrollable: find.byType(Scrollable).last);
  await _tester!.pumpAndSettle();
  await _tap(finder);
  _log('$_helperName: selectDropDownList: $optionText');
}

Future<bool> _expect(dynamic actual, dynamic matcher,
    {required String reason, dynamic skip}) async {
  try {
    expect(actual, matcher, reason: reason, skip: skip);
    return true;
  } catch (e) {
    return false;
  }
}

Future<void> scrollDown(Finder finder) async {
  await _scrollTo(finder, deltaY: -100.0, scrollableWidgetKey: 'ListView');
}

Future<void> scrollUp(Finder finder) async {
  await _scrollTo(finder, deltaY: 120.0, scrollableWidgetKey: 'ListView');
}

dynamic _log(String msg) {
  print(msg);
}
