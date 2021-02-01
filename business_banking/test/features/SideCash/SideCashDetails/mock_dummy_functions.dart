import 'package:flutter/cupertino.dart';
import 'package:mockito/mockito.dart';
import 'package:clean_framework/clean_framework.dart';

class DummyFunctions {
  dynamic voidCallBack(dynamic v) {}
  dynamic navigate(BuildContext ctx) {}
}

class MockDummyFunctions extends Mock implements DummyFunctions {}
