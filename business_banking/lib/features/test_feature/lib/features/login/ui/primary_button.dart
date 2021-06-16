import 'package:flutter/material.dart';

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
    return AbsorbPointer(
      absorbing: disableWhenClicked,
      child: Semantics(
        value: buttonText,
        button: true,
        child: FittedBox(
          child: ElevatedButton(
            style: Theme.of(context).textButtonTheme.style,
            onPressed: onTap,
            child: Padding(
              padding: paddingAroundText!,
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.button,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
