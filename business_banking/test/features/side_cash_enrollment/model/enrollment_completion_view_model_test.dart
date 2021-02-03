
import 'package:business_banking/features/side_cash_enrollment/model/enrollment_completion_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {

  test("initial enrollment_competion_view model props test", () {
    final EnrollmentCompletionViewModel entity = EnrollmentCompletionViewModel(
      message: "You are now enrolled",
      isSuccess: true,
    );
    expect(entity.props, [
      "You are now enrolled",
      true
    ]);
  });
}