import 'package:business_banking/features/test_feature/lib/features/login/ui/text_regular.dart';
import 'package:flutter/material.dart';

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
          const Icon(Icons.check_box_outline_blank, size: 25),
          TextRegularHNB(
            text: content,
          )
        ],
      ),
    );
  }
}
