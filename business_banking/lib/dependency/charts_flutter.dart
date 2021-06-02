import 'package:clean_framework/clean_framework.dart';

enum ChartType { line, bar, pie }

class ChartsFlutter extends ExternalDependency {
  final List<dynamic> chartData;
  final ChartType chartType;

  ChartsFlutter(this.chartData, this.chartType);
}
