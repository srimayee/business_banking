import 'package:business_banking/features/promos/bloc/promos_bloc.dart';
import 'package:business_banking/features/promos/models/promos_view_model.dart';
import 'package:business_banking/features/promos/ui/promos_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PromoPresenter extends Presenter<PromosBloc, PromosViewModel, PromosScreen> {
  @override
  Stream<PromosViewModel> getViewModelStream(PromosBloc bloc) {
    return bloc.promosViewModelPipe.receive;
  }

  @override
  PromosScreen buildScreen(BuildContext context, PromosBloc bloc, PromosViewModel viewModel) {
    return PromosScreen(
      viewModel: viewModel,
      launchURL: launchURL,
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
