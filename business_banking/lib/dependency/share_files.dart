import 'package:clean_framework/clean_framework.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';

class ShareFiles extends ExternalDependency {
  static shareFile(BuildContext context, String filePath) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    Share.shareFiles([filePath],
        text: 'text',
        subject: 'subject',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
