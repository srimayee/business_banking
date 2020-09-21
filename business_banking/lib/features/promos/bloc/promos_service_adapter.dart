import 'package:business_banking/features/promos/api/promos_service.dart';
import 'package:business_banking/features/promos/api/promos_service_request_model.dart';
import 'package:business_banking/features/promos/api/promos_service_response_model.dart';
import 'package:business_banking/features/promos/models/promos_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class PromoServiceAdapter extends ServiceAdapter<PromosEntity, PromosServiceRequestModel, PromosServiceResponseModel, PromosService> {
  PromoServiceAdapter() : super(PromosService());

  @override
  PromosServiceRequestModel createRequest(PromosEntity entity) => PromosServiceRequestModel(customerId: '123');

  @override
  PromosEntity createEntity(initialEntity, responseModel) {
    return initialEntity.merge(
      imageUrl: responseModel.imageUrl,
      link: responseModel.externalUrl,
    );
  }
}
