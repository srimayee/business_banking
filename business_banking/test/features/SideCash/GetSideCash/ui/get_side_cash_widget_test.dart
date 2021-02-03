import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_bloc.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:business_banking/features/side_cash/get_side_cash/ui/get_side_cash_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  GetSideCashBloc getSideCashBloc;
  setUp(() {
    getSideCashBloc = GetSideCashBloc();
  });
  group('SideCashDetails Feature Widget', () {
    testWidgets('Build When Available', (tester) async {
      await tester.pumpWidget(Material(child: GetSideCashWidget()));
      getSideCashBloc.viewModelPipe.send(GetSideCashViewModel());
      await tester.pumpAndSettle(Duration(milliseconds: 100));
    });
  });
}
