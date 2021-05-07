import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hotels/model/hotels_view_model.dart';
import 'hotels_usecase.dart';

class HotelsBloc extends Bloc {
  //
  late HotelsUseCase _useCase;
  final hotelsViewModelPipe = Pipe<HotelsViewModel>();

  @override
  void dispose() {
    hotelsViewModelPipe.dispose();
  }

  HotelsBloc() {
    print('HotelsBlock 02');
    _useCase = HotelsUseCase(
        (viewModel) => hotelsViewModelPipe.send(viewModel as HotelsViewModel));

    hotelsViewModelPipe.whenListenedDo(_useCase.create);
  }
}
