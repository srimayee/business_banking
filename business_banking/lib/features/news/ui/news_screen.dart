import 'package:business_banking/features/news/model/news_details_view_model.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:business_banking/features/news/ui/widgets/news_row_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class NewsScreen extends Screen {
  final NewsViewModel viewModel;

  NewsScreen({@required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: ListView(
          key: Key('containerListView'),
          // controller: provider.controller,
          children: <Widget>[
            ListView.builder(
              key: Key('builderListView'),
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              shrinkWrap: true,
              itemCount: viewModel.allNews.length,
              itemBuilder: (BuildContext context, int index) {
                final _detailsViewModel = _makeDetailsViewModel(index);
                return Padding(
                  padding: EdgeInsets.all(5.0),
                  child: NewsRowWidget(viewModel: _detailsViewModel),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  NewsDetailsViewModel _makeDetailsViewModel(int selectedIndex) {
    return NewsDetailsViewModel(
        author: viewModel.allNews[selectedIndex].author ?? '',
        title: viewModel.allNews[selectedIndex].title ?? '',
        description: viewModel.allNews[selectedIndex].description ?? '',
        url: viewModel.allNews[selectedIndex].url ?? '',
        urlToImage: viewModel.allNews[selectedIndex].urlToImage ?? '',
        publishedAt: viewModel.allNews[selectedIndex].publishedAt ?? '');
  }
}
