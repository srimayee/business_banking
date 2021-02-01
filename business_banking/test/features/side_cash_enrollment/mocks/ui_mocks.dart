import 'package:flutter/cupertino.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}


class MockedBuildContext extends Mock implements BuildContext {
  MockedBuildContext();

  factory MockedBuildContext.withInheritFromWidgetNull() {
    var mockBuildContext = MockedBuildContext();
    when(mockBuildContext.dependOnInheritedWidgetOfExactType())
        .thenReturn(null);
    return mockBuildContext;
  }
}
