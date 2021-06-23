import 'package:flutter/material.dart';

class SecondaryButtonHNB extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final bool disableWhenClicked;

  const SecondaryButtonHNB(
      {Key? key,
      required this.buttonText,
      required this.onTap,
      required this.disableWhenClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disableWhenClicked,
      child: Semantics(
        value: buttonText,
        button: true,
        child: Container(
          constraints: const BoxConstraints(maxHeight: 50),
          child: FittedBox(
            child: IntrinsicHeight(
              child: OutlinedButton(
                onPressed: onTap,
                child: Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
