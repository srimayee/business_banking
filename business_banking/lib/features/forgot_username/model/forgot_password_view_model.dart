import 'package:clean_framework/clean_framework.dart';

class ForgotPasswordViewModel extends ViewModel {
  final String? email;
  final serviceStatus;
  final dataStatus;

  ForgotPasswordViewModel({this.email, this.serviceStatus = ServiceStatus.unknown, this.dataStatus = DataStatus.unknown})
      : assert(email != null);

  @override
  List<Object?> get props => [email, serviceStatus, dataStatus];
}

enum ServiceStatus { success, fail, unknown }
enum DataStatus { valid, invalid, unknown }
