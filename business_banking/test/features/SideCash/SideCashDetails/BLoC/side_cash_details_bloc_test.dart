import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_bloc.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('SideCashDetailsBloc gets view model', () {
    final bloc = SideCashDetailsBloc();
    bloc.viewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<SideCashDetailsViewModel>());
      bloc.dispose();
    }));
  });
}
