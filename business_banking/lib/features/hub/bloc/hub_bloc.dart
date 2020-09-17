import 'package:business_banking/features/hub/models/hub_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class HubBloc extends Bloc {
  final hubViewModelPipe = Pipe<HubViewModel>();

  HubBloc() {
    hubViewModelPipe.send(HubViewModel());
  }
  @override
  void dispose() {
    hubViewModelPipe.dispose();
  }
}
