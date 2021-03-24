import 'package:business_banking/features/news/model/news_details_view_model.dart';
import 'package:business_banking/features/news/model/news_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

class NewsDetailsUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  NewsDetailsUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<NewsEntity>();
    if (_scope == null) {
      throw AssertionError('NewsEntity does not exist');
    }

    _scope.subscription = _notifyTransferSubscribers;
    final entity = ExampleLocator().repository.get<NewsEntity>(_scope);
    _viewModelCallBack(buildViewModelForSelectedNews(entity));
  }

  void _notifyTransferSubscribers(entity) {
    _viewModelCallBack(buildViewModelForSelectedNews(entity));
  }

  NewsDetailsViewModel buildViewModelForSelectedNews(NewsEntity entity) {
      return NewsDetailsViewModel(
          author: entity.selectedNews.author,
          title: entity.selectedNews.title,
          description: entity.selectedNews.description,
          url: entity.selectedNews.url,
          urlToImage: entity.selectedNews.urlToImage,
          publishedAt: entity.selectedNews.publishedAt);
  }
}
