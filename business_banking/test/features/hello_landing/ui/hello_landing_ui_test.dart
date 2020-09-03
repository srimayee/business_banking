import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_landing/bloc/hello_landing_bloc.dart';
import 'package:business_banking/features/hello_landing/ui/hello_landing_widget.dart';
import 'package:business_banking/features/hello_landing/ui/hello_landing_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../bloc/hello_landing_bloc_mock.dart';

void main() {
  testWidgets('HelloLanding, with mocked bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<HelloLandingBloc>(
            create: (_) => HelloLandingBlocMock(), child: HelloLandingWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(HelloLandingPresenter), findsOneWidget);
  });
}