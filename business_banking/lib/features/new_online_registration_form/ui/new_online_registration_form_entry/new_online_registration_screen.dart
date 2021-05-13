import 'dart:ui';

import 'package:business_banking/features/new_online_registration_form/model/new_online_registration_form_entry/new_online_registration_view_model.dart';
import 'package:business_banking/features/new_online_registration_form/ui/new_online_registration_form_entry/new_online_registration_actions.dart';
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

  @override
  Widget build(BuildContext context) {
    _nameValueTextEditingController.text = viewModel.cardHolderName!;
    _cardNumberValueTextEditingController.text = viewModel.cardNumber!;
    _userEmailAddressController.text = viewModel.email!;
    _userPasswordValueTextEditingController.text = viewModel.userPassword!;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
            child: Form(
                key: _form,
                child: Column(
                  children: [
                    customTextField(
                      textFieldKey: Key('cardHolderName-TxtField'),
                      controller: _nameValueTextEditingController,
                      inputStatus: viewModel.cardHolderNameStatus,
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
                      onSaved: (val) {
                        actions.onUpdateNumberParam(val!);
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
                            onPressed: () {
                              _form.currentState!.save();
                              actions.pressCreateButton(
                                  context,
                                  _nameValueTextEditingController.text,
                                  _cardNumberValueTextEditingController.text,
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
    final FormFieldSetter<String>? onSaved,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    final String? inputStatus,
    Key? textFieldKey,
  }) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextFormField(
          key: textFieldKey,
          controller: controller, //viewModel.paymentValueTextEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            suffixStyle: TextStyle(color: Colors.orangeAccent),
            labelText: labelText,
          ),
          textInputAction: TextInputAction.done,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onSaved: onSaved,
        ),
      ),
      if (inputStatus!.isNotEmpty)
        Padding(
            padding: EdgeInsets.only(left: 15, bottom: 10),
            child: Row(children: [
              Expanded(
                  child: Text(
                inputStatus,
                style: TextStyle(color: Colors.red, fontSize: 12),
              )),
            ])),
    ]);
  }
}
