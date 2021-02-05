import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class TestableWidgetWrapper extends StatelessWidget {
  final Widget child;
  final List<String> routes;
  final MockNavigatorObserver mockNavigatorObserver = MockNavigatorObserver();
  final Map<String, WidgetBuilder> routesMap;

  TestableWidgetWrapper(
    this.child, {
    this.routes = const [],
    this.routesMap,
  });

  // Mocked routes setup. By default, it provides the root with the widget to be tested.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // navigatorKey: navigatorKey,
        initialRoute: '/',
        routes: routesMap ?? setUpRoutes(child, routes),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [mockNavigatorObserver],
        builder: (context, child) {
          // var theme = (userSession?.isPrivateCustomer ?? false)
          //     ? PrivateClientGroupHuntingtonTheme(context)
          //     : PersonalHuntingtonTheme(context);

          return child;
        });
  }

  setUpRoutes(Widget child, List<String> routes) {
    Map<String, WidgetBuilder> mergedRoutes = {
      '/': (BuildContext context) => child,
    };
    return mergedRoutes;
  }
}
