import 'package:business_banking/features/promos/models/promos_view_model.dart';
import 'package:business_banking/features/promos/ui/network_image_container.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class PromosScreen extends Screen {
  final PromosViewModel viewModel;
  final Function openUrl;

  PromosScreen({@required this.viewModel, this.openUrl})
      : assert(viewModel != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: Key('network_image_container'),
      onTap: () {
        openUrl(viewModel.link);
      },
      child: NetworkImageContainer(
        width: 300,
        height: 300,
        url: viewModel.imageUrl,
      ),
    );
  }
}
