import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NetworkImageContainer extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  const NetworkImageContainer({Key? key, this.url, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasUrl = url != null && url!.isNotEmpty;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        image: hasUrl
            ? DecorationImage(
                image: NetworkImage(url!),
              )
            : null,
      ),
      child: !hasUrl
          ? Center(
              child: Text('There is a problem loading the image'),
            )
          : null,
    );
  }
}
