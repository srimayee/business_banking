

import 'package:clean_framework/clean_framework.dart';

class EnrollmentCompletionViewModel extends ViewModel {
  final String message;
  final bool isSuccess;

  @override
  List<Object> get props => [message, isSuccess];

  EnrollmentCompletionViewModel({
    this.message,
    this.isSuccess,
  });
}
