import 'package:business_banking/features/budget/model/budget_entity.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/model/chart_data_model.dart';
import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:business_banking/locator.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BudgetChartUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope? _scope;

  BudgetChartUseCase(Function(ViewModel) viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<BudgetEntity>();
    if (_scope != null) {
      _scope!.subscription = _notifySubscribers;
      final entity = ExampleLocator().repository.get<BudgetEntity>(_scope!);
      _buildViewModelWithChart(entity);
    }
  }

  void _notifySubscribers(entity) {
    _buildViewModelWithChart(entity);
  }

  _buildViewModelWithChart(BudgetEntity entity) async {
    updateViewModelWithChartData(entity).then((updatedEntity) {
      if (updatedEntity.hasErrors()) {
        _viewModelCallBack(BudgetViewModel(
            accountInfo: updatedEntity.accountInfo,
            allTransactions: updatedEntity.allTransactions!,
            filteredTransactions: updatedEntity.filteredTransactions!,
            serviceStatus: TransactionsServiceStatus.fail,
            chartData: []));
      } else {
        _viewModelCallBack(BudgetViewModel(
            accountInfo: updatedEntity.accountInfo,
            allTransactions: updatedEntity.allTransactions!,
            filteredTransactions: updatedEntity.filteredTransactions!,
            serviceStatus: TransactionsServiceStatus.success,
            chartData: updatedEntity.chartData));
      }
    });
  }

  Future<BudgetEntity> updateViewModelWithChartData(BudgetEntity entity) async {
    final _chartData = _createChartData(entity);

    //updating our entity
    final updatedEntity = entity.merge(
        chartData: _chartData, filteredTransactions: entity.allTransactions);
    ExampleLocator().repository.update<BudgetEntity>(_scope!, updatedEntity);

    //returning updated entity
    return updatedEntity;
  }

  void applyFilter(String value) async {
    final updatedEntity =
        ExampleLocator().repository.get<BudgetEntity>(_scope!);

    final filteredTransactions = updatedEntity.filterWith(value);
    if (filteredTransactions != null) {
      _viewModelCallBack(BudgetViewModel(
          accountInfo: updatedEntity.accountInfo,
          allTransactions: updatedEntity.allTransactions!,
          filteredTransactions: filteredTransactions,
          serviceStatus: TransactionsServiceStatus.success,
          chartData: updatedEntity.chartData));
    }
  }

  static Color _segmentColorPalette(int index) {
    switch (index) {
      case 0:
        return MaterialPalette.red.shadeDefault.lighter;
      case 1:
        return MaterialPalette.green.shadeDefault.lighter;
      case 2:
        return MaterialPalette.blue.shadeDefault.lighter;
      case 3:
        return MaterialPalette.yellow.shadeDefault.lighter;
      case 4:
        return MaterialPalette.deepOrange.shadeDefault.lighter;
      case 5:
        return MaterialPalette.indigo.shadeDefault.lighter;
      case 6:
        return MaterialPalette.pink.shadeDefault.lighter;
      case 7:
        return MaterialPalette.purple.shadeDefault.lighter;
      default:
        return MaterialPalette.gray.shadeDefault.lighter;
    }
  }

  /// Create one series with sample hard coded data.
  static List<Series<ChartDataModel, int>> _createChartData(
      BudgetEntity entity) {
    if (entity.allTransactions!.length == 0) {
      return [];
    }

    List<dynamic> categoryList =
        entity.allTransactions!.map((array) => array.category).toSet().toList();
    //local variables for summation of amount per category
    String category = '';
    List<PostedTransactions> categoryList2;
    int totalAmount = 0;
    final List<ChartDataModel> data = [];

    // for each category
    for (int i = 0; i < categoryList.length; i++) {
      category = categoryList[i] as String;
      // get txn matching selected category
      categoryList2 =
          entity.allTransactions!.where((i) => i.category == category).toList();
      totalAmount = categoryList2
          .map<int>((m) => m.debitAmount.toInt())
          .reduce((a, b) => a + b);
      // add it to our data source
      data.add(
          ChartDataModel(i, totalAmount, category, _segmentColorPalette(i)));
    }

    return [
      new Series<ChartDataModel, int>(
        id: 'budget',
        domainFn: (ChartDataModel sales, _) => sales.segmentIndex,
        measureFn: (ChartDataModel sales, _) => sales.segmentTotal,
        colorFn: (ChartDataModel sales, _) => sales.segmentColor,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (ChartDataModel row, _) {
          String catCode = row.segmentLabel;
          if (catCode.length > 8) {
            catCode = catCode.substring(0, 8);
          }
          return '$catCode: \$${row.segmentTotal}';
        },
      )
    ];
  }
}
