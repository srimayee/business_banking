import 'package:business_banking/features/news/api/news_service.dart';
import 'package:business_banking/features/news/bloc/news_usecase.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class NewsBloc extends Bloc {
  NewsUsecase _useCase;

  final newsViewModelPipe = Pipe<NewsViewModel>();

  @override
  void dispose() {
    newsViewModelPipe.dispose();
  }

  NewsBloc({NewsService newsService}) {
    _useCase = NewsUsecase((viewModel) => newsViewModelPipe.send(viewModel));
    newsViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
