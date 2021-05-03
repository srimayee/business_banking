import 'dart:io';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/deposit_check/model/2nd_data_entry/deposit_check_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'deposit_check_presenter.dart';

class DepositCheckScreen extends Screen {
  final DepositCheckViewModel viewModel;
  final DepositCheckPressenterActions pressenterAction;

  DepositCheckScreen({required this.viewModel, required this.pressenterAction});
  final _form = GlobalKey<FormState>();
  final _emailFNode = FocusNode();
  final _depositAmountTxtedCtrl = TextEditingController();
  final _userEmailTxtedCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _depositAmountTxtedCtrl.text = viewModel.depositAmount.toString();
    _depositAmountTxtedCtrl.selection = TextSelection.fromPosition(
        TextPosition(offset: _depositAmountTxtedCtrl.text.length));

    _userEmailTxtedCtrl.text = viewModel.userEmail;
    _userEmailTxtedCtrl.selection = TextSelection.fromPosition(
      TextPosition(offset: _userEmailTxtedCtrl.text.length),
    );

    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: GestureDetector(
            child: Icon(
              Icons.chevron_left,
              size: 40.0,
            ),
            onTap: () {
              pressenterAction.popNavigationListener(context);
            },
            key: Key('Deposit-Check-Back-Button'),
          ),
          title: AutoSizeText(
            'DEPOSIT CHECKS',
            maxFontSize: 16,
            minFontSize: 10,
          ),
        ),
        body: Align(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
              key: Key('Scroll-View-Key'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset('assets/images/bank-check.png',
                            scale: 10, fit: BoxFit.cover),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Text(
                            "Deposit to " +
                                viewModel.accountInfo!.accountNickname,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Front of Check'),
                              GestureDetector(
                                key: Key('Check-Front-Img-Button'),
                                child: Container(
                                  height: 150,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Color(0xffe5e5e5),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: viewModel.frontCheckImg.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.file(
                                            File(viewModel.frontCheckImg),
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Image.asset(
                                          'assets/images/img-icon.png',
                                          fit: BoxFit.scaleDown,
                                          scale: 10,
                                        ),
                                ),
                                onTap: () {
                                  pressenterAction.onPickFrontImg();
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Back of Check'),
                              GestureDetector(
                                key: Key('Check-Back-Img-Button'),
                                child: Container(
                                  height: 150,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Color(0xffe5e5e5),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: viewModel.backCheckImg.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.file(
                                            File(viewModel.backCheckImg),
                                            fit: BoxFit.cover,
                                          ))
                                      : Image.asset(
                                          'assets/images/img-icon.png',
                                          fit: BoxFit.scaleDown,
                                          scale: 10,
                                        ),
                                ),
                                onTap: () {
                                  pressenterAction.onPickBackImg();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                        key: _form,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  primaryColor: Colors.green,
                                  textSelectionTheme: TextSelectionThemeData(
                                      selectionHandleColor: Colors.green,
                                      selectionColor: Colors.green),
                                ),
                                child: TextFormField(
                                  key: Key('Deposit-Check-Amount-Txtfild'),
                                  controller: _depositAmountTxtedCtrl,
                                  cursorColor: Colors.green,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      errorStyle: TextStyle(
                                          color: Colors.red, fontSize: 12),
                                      prefixIcon:
                                          Icon(Icons.attach_money_outlined),
                                      suffixStyle:
                                          TextStyle(color: Colors.orangeAccent),
                                      labelText: 'Deposit Amount'),
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^(\d+)?\.?\d{0,2}')),
                                  ],
                                  onFieldSubmitted: (val) {
                                    pressenterAction
                                        .onDepositCheckAmountSavedListener(val);
                                    FocusScope.of(context)
                                        .requestFocus(_emailFNode);
                                  },
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        double.parse(value) == 0.0) {
                                      return 'Please provide a value.';
                                    }
                                  },
                                  onSaved: (val) => pressenterAction
                                      .onDepositCheckAmountSavedListener(
                                          val ?? ''),
                                ),
                              ),
                            ),
                            if (viewModel.depositAmountStatus != null &&
                                viewModel.depositAmountStatus!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text(
                                  viewModel.depositAmountStatus!,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  primaryColor: Colors.green,
                                  textSelectionTheme: TextSelectionThemeData(
                                      selectionHandleColor: Colors.green,
                                      selectionColor: Colors.green),
                                ),
                                child: TextFormField(
                                  key: Key('Deposit-Check-Email-Txtfild'),
                                  controller: _userEmailTxtedCtrl,
                                  focusNode: _emailFNode,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      prefixIcon: Icon(Icons.email_outlined),
                                      errorStyle: TextStyle(
                                          color: Colors.red, fontSize: 12),
                                      suffixStyle:
                                          TextStyle(color: Colors.orangeAccent),
                                      labelText: 'Email Address'),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please provide a value.';
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (val) {
                                    pressenterAction
                                        .onUserEmailSavedListener(val);
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  },
                                  onSaved: (val) => pressenterAction
                                      .onUserEmailSavedListener(val ?? ''),
                                ),
                              ),
                            ),
                            if (viewModel.userEmailStatus != null &&
                                viewModel.userEmailStatus!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text(
                                  viewModel.userEmailStatus!,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12),
                                ),
                              ),
                          ],
                        )),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5.0)
                        ]),
                    child: Center(
                      child: Text(
                        '''Deposit by 11 PM ET and your money will typical be available for withdrawl by next business day.''',
                        style: TextStyle(color: Colors.black54, fontSize: 17),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        key: Key('Deposit-Check-Confirm-Button'),
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            side: BorderSide(width: 2, color: Colors.green)),
                        onPressed: () {
                          pressenterAction.onTapConfirmBtn(
                              context, _form, viewModel);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              )),
        ));
  }
}
