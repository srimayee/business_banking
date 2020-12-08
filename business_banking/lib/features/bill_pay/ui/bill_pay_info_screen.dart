import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/bill_pay/model/entities/account_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/biller_entity.dart';
import 'package:business_banking/features/bill_pay/model/view_models/bill_pay_info_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class BillPayInfoScreen extends Screen {
  final BillPayInfoViewModel viewModel;

  BillPayInfoScreen(this.viewModel);

  // final VoidCallback submitPayment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Bill Pay',
                  style: TextStyle(color: Colors.lightGreen, fontSize: 30.0),
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "To Biller: ",
                style: TextStyle(fontSize: 20),
              ),
              for (BillerEntity b in viewModel.billers)
                RadioListTile(
                    title: Text(b.billerName),
                    subtitle: Text(b.accountNumber),
                    value: false,
                    groupValue: null,
                    onChanged: null),
              SizedBox(
                height: 4,
              ),
              Text(
                "From Account: ",
                style: TextStyle(fontSize: 20),
              ),
              for (AccountEntity a in viewModel.accounts)
                RadioListTile(
                    title: Text(a.accountTitle),
                    subtitle: Text(a.accountNumber),
                    secondary: Text("\$${a.accountBalance.toStringAsFixed(2)}"),
                    value: false,
                    groupValue: null,
                    onChanged: null),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                // validator: (String inputValue){
                // if(inputValue.length > 5) {
                //   return "exceeding maximum character length";
                // }
                // return "";
                // },
                decoration: InputDecoration(
                    helperText:
                        "dollar amount: min \$${viewModel.rules.paymentMin.toStringAsFixed(2)} | max \$${viewModel.rules.paymentMax.toStringAsFixed(2)}"),
              ),
              TextFormField(
                // validator: (String inputValue){
                // if(inputValue.length > 5) {
                //   return "exceeding maximum character length";
                // }
                // return "";
                // },
                decoration: InputDecoration(
                    helperText:
                        "memo (${viewModel.rules.memoLimit} character limit)"),
              ),
              SizedBox(
                height: 6,
              ),
              RaisedButton(
                color: Colors.green,
                child: Text("Submit", style: TextStyle(color: Colors.white)),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
