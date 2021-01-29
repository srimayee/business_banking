import 'package:clean_framework/clean_framework.dart';

class EnrollmentAdvertisementViewModel extends ViewModel {
  final String message;

  EnrollmentAdvertisementViewModel({this.message});
  @override
  List<Object> get props => [message];
}
