import 'package:business_banking/features/online_registration/model/online_registration_form_entry/online_registration_view_model.dart';
import 'package:business_banking/features/online_registration/ui/online_registration_form_entry/online_registration_actions.dart';
import 'package:business_banking/features/online_registration/ui/widgets/common_textfield_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class OnlineRegistrationScreen extends Screen {
  final OnlineRegistrationViewModel? viewModel;
  final OnlineRegistrationPresenterActions? presenterAction;

  OnlineRegistrationScreen({
    this.presenterAction,
    this.viewModel,
  });
  final _cardHolderNameCtrl = TextEditingController();
  final _cardHolderNumberCtrl = TextEditingController();
  final _ssnLastFourDigitsCtrl = TextEditingController();
  final _userEmailAddressCtrl = TextEditingController();
  final _userPasswordCtrl = TextEditingController();
  final GlobalKey<FormState> _key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    _cardHolderNameCtrl.text = viewModel!.cardHolderName.toString();
    _cardHolderNameCtrl.selection = TextSelection.fromPosition(
        TextPosition(offset: _cardHolderNameCtrl.text.length));

    _cardHolderNumberCtrl.text = viewModel!.cardNumber.toString();
    _cardHolderNumberCtrl.selection = TextSelection.fromPosition(
        TextPosition(offset: _cardHolderNumberCtrl.text.length));

    _ssnLastFourDigitsCtrl.text = viewModel!.ssnLastFourDigits.toString();
    _ssnLastFourDigitsCtrl.selection = TextSelection.fromPosition(
        TextPosition(offset: _ssnLastFourDigitsCtrl.text.length));

    _userEmailAddressCtrl.text = viewModel!.email.toString();
    _userEmailAddressCtrl.selection = TextSelection.fromPosition(
        TextPosition(offset: _userEmailAddressCtrl.text.length));

    _userPasswordCtrl.text = viewModel!.userPassword.toString();
    _userPasswordCtrl.selection = TextSelection.fromPosition(
        TextPosition(offset: _userPasswordCtrl.text.length));

    return Scaffold(
        body: Form(
            key: _key,
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                MyTextFormField(
                  textFieldKey: Key('cardHolderName-TxtField'),
                  textEditingController: _cardHolderNameCtrl,
                  hintText: 'Full Name',
                  validator: (val) {
                    presenterAction!.onUserNameSavedListener(val!);
                  },
                  onSaved: (String? name) {
                    presenterAction!.onUserNameSavedListener(name!);
                  },
                  status: viewModel!.cardHolderNameStatus,
                ),
                MyTextFormField(
                  textFieldKey: Key('cardHolderNumber-TxtField'),
                  textEditingController: _cardHolderNumberCtrl,
                  hintText: 'Credit Card Number',
                  maxLength: 16,
                  keyBoardType: TextInputType.number,
                  validator: (String? val) {
                    // presenterAction2!(val);
                    presenterAction!.onUserCardNumberSavedListener(val!);
                  },
                  onSaved: (String? cardNumber) {
                    presenterAction!.onUserCardNumberSavedListener(cardNumber!);
                  },
                  status: viewModel!.cardNumberStatus,
                ),
                MyTextFormField(
                  textFieldKey: Key('ssnLastFourDigits-TxtField'),
                  textEditingController: _ssnLastFourDigitsCtrl,
                  hintText: 'SSN Last Four Digits',
                  maxLength: 4,
                  keyBoardType: TextInputType.number,
                  validator: (String? val) {
                    presenterAction!
                        .onUpdateSSNLastFourDigitsSavedListener(val!);
                  },
                  onSaved: (String? lastFourDigits) {
                    presenterAction!.onUpdateSSNLastFourDigitsSavedListener(
                        lastFourDigits!);
                  },
                  status: viewModel!.ssnLastFourDigitsStatus,
                ),
                // MyTextFormField(
                //   textFieldKey: Key('userEmailAddress-TxtField'),
                //   textEditingController: _userEmailAddressCtrl,
                //   hintText: 'Email ID',
                //   keyBoardType: TextInputType.emailAddress,
                //   validator: (String? val) {
                //     presenterAction!.onUpdateEmailSavedListener(val!);
                //   },
                //   onSaved: (String? email) {
                //     presenterAction!.onUpdateEmailSavedListener(email!);
                //   },
                //   status: viewModel!.userEmailStatus,
                // ),
                // MyTextFormField(
                //   textFieldKey: Key('userPassword-TxtField'),
                //   textEditingController: _userPasswordCtrl,
                //   hintText: 'Password',
                //   isPassword: true,
                //   validator: (String? value) {
                //     print("Here with Password validator");
                //     presenterAction!.onUpdatePasswordListener(value!);
                //   },
                //   onSaved: (String? password) {
                //     presenterAction!.onUpdatePasswordListener(password!);
                //   },
                //   status: viewModel!.userPasswordStatus,
                // ),
                new ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      print('validate and saving');
                      _key.currentState!.save();
                    }
                    presenterAction!.onTapCreateAccountBtn(context, viewModel!);
                  },
                  child: new Text('Create Account'),
                )
              ],
            ))));
  }
}
