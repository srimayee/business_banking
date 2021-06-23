import 'package:flutter/material.dart';
import 'package:hnb_flutter_ui/src/ui/themes/colors_hnb.dart';

class ClearIconHNB extends StatelessWidget {
  final VoidCallback? onTapAction;
  final Color? iconColor;
  final String? semanticLabelForAction;
  final Alignment alignmentOfIcon;
  final double iconSize;

  const ClearIconHNB({
    Key? key,
    required this.onTapAction,
    this.iconColor,
    this.semanticLabelForAction,
    this.alignmentOfIcon = Alignment.centerRight,
    this.iconSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String semanticLabel = semanticLabelForAction ?? 'Tap to clear';
    return Semantics(
        key: const Key('clear-icon-semantics'),
        excludeSemantics: true,
        label: 'Clear Icon $semanticLabel',
        child: IconButton(
          icon: const Icon(
            Icons.cancel_rounded,
            key: Key('clear-icon'),
          ),
          onPressed: onTapAction ?? () {},
          color: iconColor ?? accent.withOpacity(0.7),
          alignment: alignmentOfIcon,
          iconSize: iconSize,
        ));
  }
}
