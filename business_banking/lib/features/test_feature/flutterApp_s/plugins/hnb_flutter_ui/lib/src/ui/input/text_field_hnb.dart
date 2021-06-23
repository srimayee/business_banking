import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hnb_flutter_ui/src/ui/themes/colors_hnb.dart';
import 'package:hnb_flutter_ui/src/ui/typography/field_label_hnb.dart';

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
  final EdgeInsetsGeometry? paddingAroundTextField;

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
    this.paddingAroundTextField = const EdgeInsets.only(
      bottom: 4.0,
      top: 11.0,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
        value: "$fieldLabel Field",
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: FieldLabelHNB(text: fieldLabel)),
              ConstrainedBox(
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 10),
                    fillColor: background,
                    filled: true,
                    alignLabelWithHint: true,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    errorText: errorText,
                    errorMaxLines: 1,
                    errorStyle: Theme.of(context).textTheme.bodyText1,
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        borderSide: BorderSide(color: border, width: 0.0)),
                    border: const OutlineInputBorder(),
                    suffixIcon: suffixIcon,
                  ),
                ),
              )
            ]));
  }
}
