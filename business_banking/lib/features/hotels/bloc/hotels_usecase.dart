import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hotels/api/hotels_service_adapter.dart';
import 'package:business_banking/features/hotels/model/hotels_entity.dart';
import 'package:business_banking/features/hotels/model/hotels_view_model.dart';
import 'package:business_banking/locator.dart';

class HotelsUseCase extends UseCase {
  late final ViewModelCallback<ViewModel> _viewModelCallBack;

  HotelsUseCase(ViewModelCallback<ViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  void create() async {
    final scope = ExampleLocator()
        .repository
        .create<HotelsEntity>(HotelsEntity(), _notifySubscribers);

    await ExampleLocator()
        .repository
        .runServiceAdapter(scope, HotelsServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  HotelsViewModel buildViewModel(HotelsEntity entity) {
    return HotelsViewModel(
        title: entity.title,
        city: entity.city,
        stateCode: entity.stateCode,
        isLiked: entity.isLiked,
        starRating: entity.starRating,
        price: entity.price,
        imageUrl: entity.imageUrl);
  }
}
