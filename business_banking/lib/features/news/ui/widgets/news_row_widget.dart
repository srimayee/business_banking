import 'package:business_banking/features/news/model/news_details_view_model.dart';
import 'package:business_banking/features/news/ui/news_details_screen.dart';
import 'package:business_banking/features/news/ui/widgets/text_content_widget.dart';
import 'package:business_banking/features/news/ui/widgets/thumb_image_card.dart';
import 'package:flutter/material.dart';

class NewsRowWidget extends StatelessWidget {
  final NewsDetailsViewModel viewModel;

  NewsRowWidget({@required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final _title = viewModel.title ?? '';
    final _authorBy = viewModel.author ?? '';
    final _urlToImage = viewModel.urlToImage ?? '';
    return InkWell(
      key: Key('disclosureAction'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => NewsDetailsScreen(viewModel: viewModel)),
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
