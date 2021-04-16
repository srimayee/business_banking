import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/ui/donut_auto_label_chart.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class ViewChartScreen extends Screen {
  final BudgetViewModel viewModel;
  final _scaffoldkey = new GlobalKey<ScaffoldState>();

  ViewChartScreen({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    List<dynamic> categoryList = viewModel.allTransactions
        .map((array) => array.category)
        .toSet()
        .toList();

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text(viewModel.accountInfo!.accountNickname),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            child: Center(
                child: Text(
              'Your Spendings',
              style: TextStyle(fontSize: 18),
            )),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.loose(
              Size(
                double.infinity,
                MediaQuery.of(context).size.width / 1.8,
              ),
            ),
            child: DonutAutoLabelChart.withSampleData(),
          ),
          Divider(),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Card(
              elevation: 0.0,
              child: ListView(
                children: <Widget>[
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    shrinkWrap: true,
                    itemCount: viewModel.allTransactions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Container(
                          height: 30.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  viewModel.allTransactions[index].description),
                              Text('\$' +
                                  viewModel.allTransactions[index].debitAmount
                                      .toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            child: Text('Select Category'),
            onPressed: () {
              _scaffoldkey.currentState!.showBottomSheet(
                (context) {
                  return BottomSheet(
                    onClosing: () {},
                    builder: (context) {
                      return Container(
                        height: categoryList.length * 70.0,
                        color: Colors.lightGreen,
                        child: ListView(
                          children: <Widget>[
                            ButtonBar(
                              children: <Widget>[
                                CloseButton()],
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              shrinkWrap: true,
                              itemCount: categoryList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () => {},
                                  child: Center(
                                    child: Container(
                                      height: 50.0,
                                      child: Text(
                                        categoryList[index],
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
