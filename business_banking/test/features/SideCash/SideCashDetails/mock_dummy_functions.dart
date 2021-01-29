import 'package:mockito/mockito.dart';
import 'package:clean_framework/clean_framework.dart';

class DummyFunctions {
  dynamic voidCallBack(dynamic v) {}
}

class MockDummyFunctions extends Mock implements DummyFunctions {}
