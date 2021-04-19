// package
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
// internal
import 'investment_detail_service_adapter.dart';
import '../model/investment_detail_entity.dart';
import '../model/investment_detail_view_model.dart';
import '../../../locator.dart';

class InvestmentDetailUseCase extends UseCase {
  late final ViewModelCallback<InvestmentDetailViewModel> _viewModelCallBack;

  InvestmentDetailUseCase(
      ViewModelCallback<InvestmentDetailViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  void execute() async {
    final scope = ExampleLocator().repository.create<InvestmentDetailEntity>(
        InvestmentDetailEntity(), _notifySubscribers);

    await ExampleLocator()
        .repository
        .runServiceAdapter(scope, InvestmentDetailServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  InvestmentDetailViewModel buildViewModel(InvestmentDetailEntity entity) {
    return InvestmentDetailViewModel(
        accountBalance: entity.accountBalance,
        totalGainPercent: entity.totalGainPercent,
        totalGainValue: entity.totalGainValue,
        investments: entity.investments);
  }
}
