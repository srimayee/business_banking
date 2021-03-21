import 'package:business_banking/features/news/bloc/news_bloc.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

import 'news_screen.dart';

class NewsPresenter extends Presenter<NewsBloc, NewsViewModel, NewsScreen> {
  @override
  NewsScreen buildScreen(
      BuildContext context, NewsBloc bloc, NewsViewModel viewModel) {
    // implement buildScreen
    return NewsScreen(viewModel: viewModel);
  }

  @override
  Stream<NewsViewModel> getViewModelStream(NewsBloc bloc) {
    // implement getViewModelStream
    return bloc.newsViewModelPipe.receive;
  }
}
