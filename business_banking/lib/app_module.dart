import 'package:app_interview/app_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features_bank/bank_list/api/result_search_request.dart';
import 'features_bank/bank_list/ui/bank_detail_screen.dart';
import 'features_bank/bank_list/api/result_search_request.dart';
import 'features_bank/bank_list/api/result_search_request.dart';
import 'features_bank/bank_list/bloc/search_bloc.dart';
import 'features_bank/bank_list/bloc/search_by_text_usecase.dart';
import 'features_bank/bank_list/model/search_repository_impl.dart';
import 'features_bank/bank_list/ui/search_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => ResultSearchRequest(i())),
        Bind((i) => SearchByTextImpl(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => SearchBloc(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => SearchPage()),
        ModularRouter('/detail',
            child: (_, args) => BankDetailPage(model: args.data))
      ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();
}
