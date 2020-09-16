
import 'package:business_banking/features/navigation_rail/bloc/rail_bloc.dart';
import 'package:business_banking/features/navigation_rail/bloc/rail_state.dart';
import 'package:business_banking/features/navigation_rail/ui/navigation_rail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class NavigationRAilBlocMock extends Mock implements RailBloc {}

void main() {
  // ignore: close_sinks
  RailBloc railBloc;

  setUp(() {
    railBloc = NavigationRAilBlocMock();
  });

  Widget makeTestableWidget({Widget child}) {
    return BlocProvider.value(
      value: railBloc,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('Initial State Widget', (WidgetTester tester) async {

    when(railBloc.state).thenAnswer((_) => InitialHomeState());

    NavigationRailBloc navigationRailBloc = NavigationRailBloc();
    await tester.pumpWidget(makeTestableWidget(child: navigationRailBloc));

    final button1Text = find.byKey(Key('Button1'));
    expect(button1Text, findsOneWidget);


    final button2Text = find.byKey(Key('Button2'));
    expect(button2Text, findsOneWidget);

    final button3Text = find.byKey(Key('Button3'));
    expect(button3Text, findsOneWidget);

    final button4Text = find.byKey(Key('Button4'));
    expect(button4Text, findsOneWidget);

    tester.pump();

  });

}
