import 'package:business_banking/features/promos/models/promos_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class PromosScreen extends Screen {
  final PromosViewModel viewModel;
  final Function launchURL;

  PromosScreen({@required this.viewModel, this.launchURL}) : assert(viewModel != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchURL(viewModel.link);
      },
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(viewModel.imageUrl),
          ),
        ),
      ),
    );
  }
}
