import 'package:business_banking/features/news/model/news_model.dart';
import 'package:clean_framework/clean_framework.dart';

class NewsEntity extends Entity {
  final List<NewsModel> allNews;

  NewsEntity({List<EntityFailure> errors = const [], List<NewsModel> allNews})
      : allNews = allNews ?? [],
        super(errors: errors);

  @override
  List<Object> get props => [errors, allNews];

  @override
  NewsEntity merge({
    errors,
    List<NewsModel> allNews,
  }) {
    return NewsEntity(
      errors: errors ?? this.errors,
      allNews: allNews ?? this.allNews,
    );
  }
}
