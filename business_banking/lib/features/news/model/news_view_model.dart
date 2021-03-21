import 'package:business_banking/features/news/model/news_model.dart';
import 'package:clean_framework/clean_framework.dart';

class NewsViewModel extends ViewModel {
  final List<NewsModel> allNews;

  NewsViewModel(this.allNews);

  @override
  // implement props
  List<Object> get props => [allNews];
}
