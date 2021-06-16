import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldHNB extends StatelessWidget {
  final String fieldLabel;
  final TextInputType? inputType;
  final String? errorText;
  final ValueChanged<String> onTextChanged;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? textEditingController;
  final double textFieldMaxWidth;
  final double textFieldMaxHeight;
  final VoidCallback? onEditingComplete;
  final Widget? suffixIcon;

  const TextFieldHNB({
    Key? key,
    required this.fieldLabel,
    this.inputType,
    this.errorText,
    required this.onTextChanged,
    this.obscureText = false,
    this.inputFormatters,
    this.textEditingController,
    this.textFieldMaxWidth = 500,
    this.textFieldMaxHeight = 40,
    this.onEditingComplete,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      value: "$fieldLabel Field",
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
                maxWidth: textFieldMaxWidth, maxHeight: textFieldMaxHeight),
            child: TextField(
              onEditingComplete: onEditingComplete,
              controller: textEditingController,
              cursorColor: Theme.of(context).primaryColor,
              onChanged: onTextChanged,
              enableInteractiveSelection: false,
              keyboardType: inputType,
              style: Theme.of(context).textTheme.subtitle1,
              obscureText: obscureText,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                labelText: fieldLabel,
                labelStyle: Theme.of(context).textTheme.headline6,
                //suffixIcon: ,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                fillColor: Colors.grey.withOpacity(0.4),
                filled: true,
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                errorText: errorText,
                errorMaxLines: 1,
                errorStyle: Theme.of(context).textTheme.bodyText1,
                enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                    borderSide: BorderSide(color: Colors.grey, width: 0.0)),
                border: const OutlineInputBorder(),
                suffixIcon: suffixIcon,
              ),
            ),
          )
        ],
      ),
    );
  }
}
