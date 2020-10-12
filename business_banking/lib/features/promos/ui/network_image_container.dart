import 'package:flutter/material.dart';

class NetworkImageContainer extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  const NetworkImageContainer({Key key, this.url, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url != null && url.isNotEmpty
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
              ),
            ),
          )
        : SizedBox();
  }
}
