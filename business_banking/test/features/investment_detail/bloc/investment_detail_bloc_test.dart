import 'package:business_banking/features/investment_detail/model/investment_detail_view_model.dart';
import 'package:test/test.dart';

import 'investment_detail_bloc_mock.dart';

void main() {
  InvestmentDetailBlockMock investmentDetailBlockMock;

  setUp(() {
    investmentDetailBlockMock = InvestmentDetailBlockMock();
  });

  final tInvestment = InvestmentDetailViewModel(
      accountBalance: 1600.00,
      totalGainValue: -45.00,
      totalGainPercent: 43.33,
      investments: []);
  test('should InvestmentBloc gets model from service', () async {
    final bloc = InvestmentDetailBlockMock();

    bloc.investmentDetailViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<InvestmentDetailViewModel>());
      expect(model, tInvestment);
    }));
  });
}
