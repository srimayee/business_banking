import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class GetSideCashScreen extends Screen {
  final Function requestSideCash;
  final Function onControllerChanged;
  final GetSideCashViewModel viewModel;
  final TextEditingController inputController;

  GetSideCashScreen({
    @required this.requestSideCash,
    @required this.onControllerChanged,
    @required this.viewModel,
    @required this.inputController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key('getSideCashWidgetKey'),
      children: [
        Text('Request More Side Cash'),
        TextFormField(
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          controller: inputController,
          onChanged: (v) {
            this.onControllerChanged(v);
          },
        ),
        SizedBox(height: 10),
        this.viewModel.error == null
            ? Container()
            : Text(
                this.viewModel.error,
                style: TextStyle(color: Colors.red, fontSize: 16),
                key: Key('SideCashDetailsErrorMessage'),
              ),
        SizedBox(height: 10),
        MaterialButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            requestSideCash(inputController.text);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            color: this.viewModel.error != null ? Colors.grey : Colors.green,
            child: Text('Get Side Cash'),
          ),
        ),
      ],
    );
  }
}
