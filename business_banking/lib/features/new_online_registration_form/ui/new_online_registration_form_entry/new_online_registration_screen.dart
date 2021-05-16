import 'dart:ui';

import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_view_model.dart';
import 'package:business_banking/features/new_online_registration_form/ui/new_online_registration_form_entry/new_online_registration_actions.dart';
import 'package:business_banking/utils/card_expiry_date_formatter.dart';
import 'package:business_banking/utils/card_number_formatter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewOnlineRegistrationScreen extends Screen {
  final NewOnlineRegistrationViewModel viewModel;
  final NewOnlineRegistrationRequestActions actions;

  NewOnlineRegistrationScreen({
    required this.viewModel,
    required this.actions,
  });

  final _form = GlobalKey<FormState>();

  final _nameValueTextEditingController = TextEditingController();
  final _cardNumberValueTextEditingController = TextEditingController();
  final _userEmailAddressController = TextEditingController();
  final _userPasswordValueTextEditingController = TextEditingController();
  final _validThruController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameValueTextEditingController.text = viewModel.cardHolderName!;
    _cardNumberValueTextEditingController.text = viewModel.cardNumber!;
    _validThruController.text = viewModel.validThru!;
    _userEmailAddressController.text = viewModel.email!;
    _userPasswordValueTextEditingController.text = viewModel.userPassword!;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
            key: _form,
            child: SingleChildScrollView(
                child: Column(
              children: [
                ElevatedButton(
                  key: Key("scanButton"),
                  onPressed: () async {
                    actions.onCardScanned();
                    _cardNumberValueTextEditingController.text =
                        viewModel.cardNumber!;
                    _validThruController.text = viewModel.validThru!;
                  },
                  child: Text('scan card'),
                ),
                customTextField(
                  textFieldKey: Key('cardHolderName-TxtField'),
                  controller: _nameValueTextEditingController,
                  inputStatus: viewModel.cardHolderNameStatus,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  ],
                  labelText: 'Card Holder Name',
                  onSaved: (val) {
                    actions.onUpdateNameParam(val!);
                  },
                ),
                customTextField(
                  textFieldKey: Key('cardHolderNumber-TxtField'),
                  controller: _cardNumberValueTextEditingController,
                  inputStatus: viewModel.cardNumberStatus,
                  labelText: 'Credit Card Number',
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(19),
                    CardNumberInputFormatter()
                  ],
                  hintText: 'xxxx xxxx xxxx xxxx xxx',
                  onSaved: (val) {
                    actions.onUpdateNumberParam(val!);
                  },
                ),
                customTextField(
                  textFieldKey: Key('validThru-TxtField'),
                  controller: _validThruController,
                  inputStatus: viewModel.cardExpiryDateStatus,
                  labelText: 'Valid Thru',
                  hintText: "MM/YY",
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(5),
                    FilteringTextInputFormatter.digitsOnly,
                    CardMonthInputFormatter()
                  ],
                  onSaved: (val) {
                    actions.onUpdateCardExpiryDate(val!);
                  },
                ),
                customTextField(
                  textFieldKey: Key('userEmailAddress-TxtField'),
                  controller: _userEmailAddressController,
                  inputStatus: viewModel.userEmailStatus,
                  labelText: 'Email for login',
                  onSaved: (val) {
                    actions.onUpdateEmailAddress(val!);
                  },
                ),
                customTextField(
                  textFieldKey: Key('userPassword-TxtField'),
                  controller: _userPasswordValueTextEditingController,
                  inputStatus: viewModel.userPasswordStatus,
                  labelText: 'Password',
                  onSaved: (val) {
                    actions.onUpdatePassword(val!);
                  },
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        key: Key("createButton"),
                        onPressed: () async {
                          _form.currentState!.save();
                          actions.pressCreateButton(
                              context,
                              _nameValueTextEditingController.text,
                              _cardNumberValueTextEditingController.text,
                              _validThruController.text,
                              _userEmailAddressController.text,
                              _userPasswordValueTextEditingController.text);
                        },
                        child: Text('Create Account',
                            style: TextStyle(fontSize: 20.0))),
                  ],
                ),
              ],
            ))));
  }

  Widget customTextField({
    TextEditingController? controller,
    String? labelText,
    String hintText = '',
    final FormFieldSetter<String>? onSaved,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    final String? inputStatus,
    List<TextInputFormatter>? inputFormatters,
    Key? textFieldKey,
  }) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextFormField(
          key: textFieldKey,
          controller: controller,
          inputFormatters: inputFormatters ?? <TextInputFormatter>[],
          //viewModel.paymentValueTextEditingController,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixStyle: TextStyle(color: Colors.orangeAccent),
              labelText: labelText,
              hintText: hintText),

          textInputAction: TextInputAction.done,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onSaved: onSaved,
        ),
      ),
      checkInputStatus(inputStatus),
    ]);
  }

  Widget checkInputStatus(
    String? inputStatus,
  ) {
    if (inputStatus!.isNotEmpty) {
      return Padding(
          padding: EdgeInsets.only(left: 15, bottom: 10),
          child: Row(children: [
            Expanded(
                child: Text(
              inputStatus,
              style: TextStyle(color: Colors.red, fontSize: 12),
            )),
          ]));
    } else {
      return Container();
    }
  }
}
