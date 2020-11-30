import 'package:business_banking/features/quickpay/bloc/quickpay_bloc.dart';
import 'package:business_banking/features/quickpay/model/quickpay_view_model.dart';
import 'quickpay_bloc_mock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('QuickPayBloc gets view model, mock', () {
    final bloc = QuickPayBlocMock();

    bloc.quickPayViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<QuickPayViewModel>());
      expect(model.name, 'user name');
      expect(model.email, 'username@gmail.com');
      expect(model.imageUrl, '');
    }));
  });

  test('QuickPayBloc gets view model, real', () {
    final bloc = QuickPayBloc();

    bloc.quickPayViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<QuickPayViewModel>());
      expect(model.name, 'user name');
      expect(model.email, 'username@gmail.com');
      expect(model.imageUrl, '');
    }));
  });
}