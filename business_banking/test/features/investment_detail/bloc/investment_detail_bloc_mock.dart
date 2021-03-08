import 'package:business_banking/features/investment_detail/bloc/investment_detail_bloc.dart';
import 'package:business_banking/features/investment_detail/model/investment_detail_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class InvestmentDetailBlockMock extends Mock implements InvestmentDetailBloc {
  @override
  Pipe<InvestmentDetailViewModel> investmentDetailViewModelPipe =
      Pipe<InvestmentDetailViewModel>();

  InvestmentDetailViewModel investmentDetailViewModelSample =
      InvestmentDetailViewModel(
          accountBalance: 1600.00,
          totalGainValue: -45.00,
          totalGainPercent: 43.33,
          investments: []);

  InvestmentDetailBlockMock() {
    investmentDetailViewModelPipe.whenListenedDo(() {
      investmentDetailViewModelPipe.send(
        investmentDetailViewModelSample,
      );
    });
  }
}
