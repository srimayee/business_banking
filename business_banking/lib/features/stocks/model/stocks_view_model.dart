import 'package:clean_framework/clean_framework.dart';

class StocksViewModel extends ViewModel {
  final List<Map<String, dynamic>> stocksList;

  StocksViewModel({required this.stocksList});

  @override
  List<Object?> get props => [stocksList];
}
