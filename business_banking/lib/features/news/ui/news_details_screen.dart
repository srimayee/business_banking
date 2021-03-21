import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:business_banking/features/news/ui/widgets/text_content_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsDetailsScreen extends Screen {
  final NewsViewModel viewModel;
  final int selectedIndex;

  NewsDetailsScreen({@required this.viewModel, @required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    String _publishedDate = DateFormat.yMMMEd()
        .format(DateTime.parse(viewModel.allNews[selectedIndex].publishedAt));
    final _title = viewModel.allNews[selectedIndex].title ?? '';
    final _authorBy = viewModel.allNews[selectedIndex].author ?? '';
    final _url = viewModel.allNews[selectedIndex].url ?? '';
    final _urlToImage = viewModel.allNews[selectedIndex].urlToImage ?? '';
    final _description = viewModel.allNews[selectedIndex].description ?? '';

    String _author =
        _authorBy.length > 10 ? _authorBy.substring(0, 10) : _authorBy;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${Uri.parse(_url).host.toUpperCase()}",
          style: TextStyle(fontSize: 14.0),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: _urlToImage,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(_urlToImage), fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  TextContentWidget(
                      text: _title, style: TextContentStyle.title),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.edit),
                      Text(
                        _author,
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Icon(Icons.date_range_rounded),
                      Text(
                        '$_publishedDate',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey[700],
                  ),
                  Text(
                    _description,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
