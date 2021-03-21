import 'package:business_banking/features/news/model/news_model.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:business_banking/features/news/ui/news_details_screen.dart';
import 'package:business_banking/features/news/ui/widgets/text_content_widget.dart';
import 'package:business_banking/features/news/ui/widgets/thumb_image_card.dart';
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
      child: Expanded(
        child: Card(
          color: Colors.white,
          shadowColor: Colors.grey[500],
          elevation: 3.0,
          child: ListView(
            // controller: provider.controller,
            children: <Widget>[
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(1.0),
                    child: NewsItem(viewModel: viewModel, selectedIndex: index),
                  );
                },
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final NewsViewModel viewModel;
  final int selectedIndex;

  NewsItem({@required this.viewModel, @required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final _title = viewModel.allNews[selectedIndex].title ?? '';
    final _authorBy = viewModel.allNews[selectedIndex].author ?? '';
    final _urlToImage = viewModel.allNews[selectedIndex].urlToImage ?? '';
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => NewsDetailsScreen(
                  viewModel: viewModel, selectedIndex: selectedIndex)),
        );
      },
      child: Container(
        height: 75.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ThumbImageCard(imgUrl: _urlToImage),
            SizedBox(width: 5.0),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextContentWidget(
                      text: _title, style: TextContentStyle.title),
                  TextContentWidget(
                      text: 'By $_authorBy', style: TextContentStyle.subtitle),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              semanticLabel: 'Disclosure',
            ),
          ],
        ),
      ),
    );
  }
}
