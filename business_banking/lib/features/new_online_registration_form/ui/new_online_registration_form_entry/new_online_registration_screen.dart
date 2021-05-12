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
  final _userPasswordValueTextEditingController = TextEditingController();
  final _userEmailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // _nameValueTextEditingController.text = viewModel.cardHolderName!;
    // _cardNumberValueTextEditingController.text = viewModel.cardNumber!;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
            child: Form(
                key: _form,
                child: Column(
                  children: [
                    customTextField(
                      controller: _nameValueTextEditingController,
                      labelText: 'Card Holder Name',
                      onSaved: (val) {
                        actions.onUpdateNameParam(val!);
                      },
                    ),
                    customTextField(
                      controller: _cardNumberValueTextEditingController,
                      labelText: 'Credit Card Name',
                      onSaved: (val) {
                        actions.onUpdateNumberParam(val!);
                      },
                    ),
                    customTextField(
                      controller: _userEmailAddressController,
                      labelText: 'Email for login',
                      onSaved: (val) {
                        actions.onUpdateEmailAddress(val!);
                      },
                    ),
                    customTextField(
                      controller: _userPasswordValueTextEditingController,
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

  Widget customTextField(
      {TextEditingController? controller,
      String? labelText,
      final FormFieldSetter<String>? onSaved,
      bool obscureText = false,
      TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        controller: controller, //viewModel.paymentValueTextEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          suffixStyle: TextStyle(color: Colors.orangeAccent),
          labelText: labelText,
        ),
        textInputAction: TextInputAction.done,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: (val) {
          controller!.text = val;
          controller.selection = TextSelection.fromPosition(
              TextPosition(offset: controller.text.length));
          // onNameChanged(context, val);
        },
        onSaved: onSaved,
      ),
    );
  }
}
