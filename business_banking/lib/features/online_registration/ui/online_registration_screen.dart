import 'package:business_banking/features/online_registration/model/online_registration_view_model.dart';
import 'package:business_banking/features/online_registration/ui/widgets/common_textfield_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class OnlineRegistrationScreen extends Screen {
  final OnlineRegistrationViewModel? viewModel;
  final Function? saveEnteredCardHolderName;
  final Function? saveEnteredCardNumber;
  final Function? saveEnteredLastFourDigits;
  final Function? saveEnteredEmail;
  final Function? saveEnteredPassword;
  final Function? sendToServer;

  OnlineRegistrationScreen({
    this.saveEnteredCardHolderName,
    this.saveEnteredCardNumber,
    this.saveEnteredLastFourDigits,
    this.saveEnteredEmail,
    this.saveEnteredPassword,
    this.viewModel,
    this.sendToServer,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState>? _key = new GlobalKey();
    AutovalidateMode _validate = AutovalidateMode.disabled;

    return Scaffold(
        body: Form(
            key: _key,
            autovalidateMode: _validate,
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                MyTextFormField(
                  hintText: 'Full Name',
                  validator: validateName,
                  onSaved: (String? name) {
                    saveEnteredCardHolderName!(name);

                    // viewModel!.cardHolderName = val!;
                  },
                ),
                MyTextFormField(
                  hintText: 'Credit Card Number',
                  maxLength: 16,
                  keyBoardType: TextInputType.number,
                  validator: validateCreditCardNumber,
                  onSaved: (String? cardNumber) {
                    saveEnteredCardNumber!(cardNumber);
                  },
                ),
                MyTextFormField(
                  hintText: 'SSN Last Four digits',
                  maxLength: 4,
                  keyBoardType: TextInputType.number,
                  validator: validateSsnLastFourDigits,
                  onSaved: (String? lastFourDigits) {
                    saveEnteredLastFourDigits!(lastFourDigits);
                  },
                ),
                MyTextFormField(
                  hintText: 'Email ID',
                  keyBoardType: TextInputType.emailAddress,
                  validator: validateEmail,
                  onSaved: (String? email) {
                    saveEnteredEmail!(email);
                  },
                ),
                MyTextFormField(
                  hintText: 'Password',
                  isPassword: true,
                  validator: (String? value) {
                    String? valueValidated = validatePassword(value);
                    if (valueValidated == null) {
                      _key.currentState!.save();
                    } else {
                      return valueValidated;
                    }
                  },
                ),
                MyTextFormField(
                  hintText: 'Confirm Password',
                  isPassword: true,
                  validator: confirmPassword,
                ),
                new ElevatedButton(
                  onPressed: () => sendToServer!(_key, _validate),
                  child: new Text('Create Account'),
                )
              ],
            ))));
  }

  String? validateName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value!)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String? validatePassword(String? value) {
    String pattern = r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\w\W]{8,}$)';
    RegExp regExp = new RegExp(pattern);
    if (value!.length < 8) {
      return 'Password should be minimum 8 characters';
    } else if (!regExp.hasMatch(value)) {
      return 'Minimum eight characters, at least one uppercase letter, one lowercase letter and one number';
    }
    return null;
  }

  String? confirmPassword(String? value) {
    print(viewModel!.userPassword);
    if (value!.length < 8) {
      return 'Password should be minimum 8 characters';
    } else if (value != viewModel!.userPassword) {
      print(viewModel!.userPassword);
      return 'Password not matched';
    }
    print('confirmPassword: ${value}');
    return null;
  }

  String? validateCreditCardNumber(String? value) {
    String pattern =
        r'(^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$)';
    RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "CreditCardNumber is Required";
    } else if (!regExp.hasMatch(value!)) {
      return "Enter valid credit card number";
    }
    return null;
  }

  String? validateSsnLastFourDigits(String? value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "SSN is Required";
    } else if (value?.length != 4) {
      return "SSN number must 4 digits";
    } else if (!regExp.hasMatch(value!)) {
      return "SSN Number must be digits";
    }
    return null;
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value!)) {
      return "Invalid Email";
    }
    return null;
  }
}
