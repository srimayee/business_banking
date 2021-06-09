import 'package:business_banking/features/test_feature/lib/globals/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget textFormField(BuildContext context, String title, var keyboardType,
    {var textCapitalization,
    var action,
    var size = 14.0,
    var key,
    var fieldSubmitted,
    var focus,
    var prefixIcon,
    var onChange,
    TextEditingController? controller,
    var onComplete,
    var fontWeight,
    var textAlignment,
    var autoValidate,
    var textColor,
    var autoFocus = false,
    var suffixIcon,
    var maxLines,
    Function? onChangeValue,
    bool obscureText = false,
    var color,
    var onTap,
    var errorText,
    var colorHint,
    bool enabled = true,
    List<TextInputFormatter>? inputFormatterList}) {
  return TextFormField(
    key: key,
    textInputAction: action,
    onFieldSubmitted: fieldSubmitted,
    controller: controller,
    keyboardType: keyboardType,
    autofocus: autoFocus,
    obscureText: obscureText,
    textAlign: textAlignment ?? TextAlign.left,
    textCapitalization: textCapitalization ?? TextCapitalization.none,
    enabled: enabled,
    inputFormatters: inputFormatterList ?? [],
    onSaved: (value) {
      // print("Saved $value");
    },
    onChanged: (value) {
      onChangeValue!(value);
    },
    focusNode: focus,
    maxLines: maxLines ?? 1,
    decoration: InputDecoration(
        fillColor: Color(0xffffffff),
        filled: true,
        prefixIcon: prefixIcon,
        errorText: errorText ?? null,
        suffixIcon: suffixIcon,
        hintText: title,
        errorStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: "Arial",
            color: Colors.red),
        contentPadding: EdgeInsets.all(10.0),
        hintStyle: TextStyle(
            color: colorHint ?? Colors.grey,
            fontFamily: "Arial",
            fontWeight: FontWeight.w400,
            fontSize: size),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.black, width: 0.0)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.black, width: 0.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.red, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.black, width: 0.0)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.red, width: 1)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.black, width: 0.5))),
    style: CustomStyles().formFieldTextStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: size,
        ),
    onTap: () => onTap(controller) ?? {},
  );
}
