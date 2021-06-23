import 'package:flutter/material.dart';
import 'package:hnb_flutter_ui/hnb_flutter_ui.dart';

class PrimaryButtonHNB extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final bool disableWhenClicked;
  final EdgeInsetsGeometry? paddingAroundText;

  const PrimaryButtonHNB(
      {Key? key,
      required this.buttonText,
      required this.onTap,
      required this.disableWhenClicked,
      this.paddingAroundText =
          const EdgeInsets.only(top: 12, bottom: 12, left: 30, right: 30)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$buttonText button',
      excludeSemantics: true,
      child: AbsorbPointer(
        absorbing: disableWhenClicked,
        child: FittedBox(
          child: ElevatedButton(
            onPressed: onTap,
            child: Padding(
              padding: paddingAroundText!,
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyleHNB(context,
                        type: TextStyleType.foregroundBoldBody)
                    .style,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
