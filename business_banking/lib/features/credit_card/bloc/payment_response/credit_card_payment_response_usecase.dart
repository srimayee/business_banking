import 'package:business_banking/features/credit_card/model/payment_response/credit_card_payment_response_entity.dart';
import 'package:business_banking/features/credit_card/model/payment_response/credit_card_payment_response_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'credit_card_payment_response_service_adapter.dart';

class CreditCardPaymentResponseUseCase extends UseCase {
  RepositoryScope? _scopePaymentResponse;
  final ViewModelCallback<ViewModel> _viewModelCallBack;
  CreditCardPaymentResponseUseCase(ViewModelCallback<ViewModel> viewModelCallBack) : _viewModelCallBack = viewModelCallBack;

  void create() async {
    print("CreditCardPaymentResponseUseCase.create");
    _scopePaymentResponse = ExampleLocator().repository.create<CreditCardPaymentResponseEntity>(CreditCardPaymentResponseEntity(), _notifySubscribers);

    CreditCardPaymentResponseEntity creditCardPaymentResponseEntity = ExampleLocator().repository.get(_scopePaymentResponse!);
    print("CreditCardPaymentResponseUseCase->creditCardPaymentResponseEntity " + creditCardPaymentResponseEntity.props.toString());


    //print("CreditCardPaymentResponseUseCase->ExampleLocator().repository.runServiceAdapter");
    await ExampleLocator().repository.runServiceAdapter(_scopePaymentResponse!, CreditCardPaymentResponseServiceAdapter());

    sendViewModelToSubscribers();
  }

  void sendViewModelToSubscribers() {
    CreditCardPaymentResponseEntity creditCardPaymentResponseEntity = ExampleLocator().repository.get(_scopePaymentResponse!);
    _notifySubscribers(creditCardPaymentResponseEntity);
  }

  void _notifySubscribers(entity) {
    //print("CreditCardPaymentResponseUseCase._notifySubscribers");
    _viewModelCallBack(buildViewModel(entity));
  }

  CreditCardPaymentResponseViewModel buildViewModel(CreditCardPaymentResponseEntity creditCardPaymentResponseEntity) {
    //print("CreditCardPaymentResponseUseCase.buildViewModel");
    if (creditCardPaymentResponseEntity.errors.length > 0)
      return buildViewModelStatusError(creditCardPaymentResponseEntity) ;
    else
      return buildViewModelStatusOK(creditCardPaymentResponseEntity) ;
  }

  CreditCardPaymentResponseViewModel buildViewModelStatusOK(CreditCardPaymentResponseEntity creditCardPaymentResponseEntity) {
    //print("CreditCardPaymentResponseUseCase.buildViewModelStatusOK");
    return CreditCardPaymentResponseViewModel(
      number: creditCardPaymentResponseEntity.number,
      name: creditCardPaymentResponseEntity.name,
      lastFour: creditCardPaymentResponseEntity.lastFour,
      paymentValue: creditCardPaymentResponseEntity.paymentValue,
      paymentStatus: creditCardPaymentResponseEntity.paymentStatus,
      reasonRejected: creditCardPaymentResponseEntity.reasonRejected,
    );
  }

  CreditCardPaymentResponseViewModel buildViewModelStatusError(CreditCardPaymentResponseEntity creditCardPaymentResponseEntity) {
    //print("CreditCardPaymentResponseUseCase.buildViewModelStatusError");
    return CreditCardPaymentResponseViewModel(
      number: creditCardPaymentResponseEntity.number,
      name: creditCardPaymentResponseEntity.name,
      lastFour: creditCardPaymentResponseEntity.lastFour,
      paymentValue: creditCardPaymentResponseEntity.paymentValue,
      paymentStatus: 'Error',
      reasonRejected: 'Error: ' + creditCardPaymentResponseEntity.errors[0].toString(),
    );
  }

  clear() {
    if (_scopePaymentResponse == null) return;
    CreditCardPaymentResponseEntity creditCardPaymentResponseEntity = ExampleLocator().repository.get(_scopePaymentResponse!);
    creditCardPaymentResponseEntity.merge(
        paymentValue: 0,
        paymentStatus: '',
        reasonRejected: ''
    );
    ExampleLocator().repository.update(_scopePaymentResponse!, creditCardPaymentResponseEntity);
  }



}
