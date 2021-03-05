import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/quickpay/bloc/quickpay_bloc.dart';
import 'package:business_banking/features/quickpay/model/quickpay_view_model.dart';
import 'package:mockito/mockito.dart';

class QuickPayBlocMock extends Fake implements QuickPayBloc {
  Pipe<QuickPayViewModel> quickPayViewModelPipe = Pipe<QuickPayViewModel>();

  QuickPayBlocMock() {
    quickPayViewModelPipe.whenListenedDo(() {
      quickPayViewModelPipe.send(QuickPayViewModel(
          name: 'user name',
          email: 'username@gmail.com',
          imageUrl: ''
      ));
    });
  }

  @override
  void dispose() {}
}