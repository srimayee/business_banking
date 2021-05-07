import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/hotels/model/hotels_entity.dart';
import 'package:business_banking/features/hotels/api/hotels_service.dart';
import 'package:business_banking/features/hotels/api/hotels_service_response_model.dart';

class HotelsServiceAdapter extends ServiceAdapter<HotelsEntity,
    JsonRequestModel, HotelsServiceResponseModel, HotelsService> {
  HotelsServiceAdapter() : super(HotelsService());

  @override
  HotelsEntity createEntity(
      HotelsEntity? initialEntity, HotelsServiceResponseModel responseModel) {
    return HotelsEntity(
        title: responseModel.title,
        city: responseModel.city,
        stateCode: responseModel.stateCode,
        isLiked: responseModel.isLiked,
        starRating: responseModel.starRating,
        price: responseModel.price,
        imageUrl: responseModel.imageUrl);
  }
}
