import 'package:flutter/material.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';
import 'package:hnb_flutter_ui/src/ui/text_regular/text_regular.dart';

class CheckBoxHNB extends StatelessWidget {
  final VoidCallback onTap;
  final String content;

  const CheckBoxHNB({
    Key? key,
    required this.onTap,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('check-box'),
      onTap: () {},
      child: Column(
        children: [
          const Icon(
            Icons.check_box_outline_blank,
            size: 22,
            color: border,
          ),
          TextRegularHNB(
              text: content,
              style: TextStyleHNB(context, type: TextStyleType.accentSmallBody)
                  .style),
        ],
      ),
    );
  }
}
