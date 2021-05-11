import 'package:business_banking/features/bill_pay/api/form_screen/bill_pay_response_model.dart';
import 'package:business_banking/features/bill_pay/api/form_screen/bill_pay_service.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BillPayServiceAdapter extends ServiceAdapter<BillPayEntity,
    JsonRequestModel, BillPayResponseModel, BillPayService> {
  BillPayServiceAdapter() : super(BillPayService());

  @override
  createEntity(initialEntity, responseModel) {
    return initialEntity.merge(
        allBills: responseModel.allBills
    );
  }
}
