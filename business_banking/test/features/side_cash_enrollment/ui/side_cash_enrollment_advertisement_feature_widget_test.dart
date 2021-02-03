

import 'package:business_banking/features/side_cash_enrollment/bloc/side_cash_enrollment_bloc.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_advertisement_feature.dart';
import 'package:business_banking/features/side_cash_enrollment/ui/side_cash_enrollment_advertisement_presenter.dart';
import 'package:flutter_test/flutter_test.dart';

main() {

  group("SideCashEnrollmentAdvertisement feature widget tests", () {


    // TODO WHy does this not need a material app widget
    testWidgets("BuildWhenAvailable will create a presenter ", (tester) async {

      final widget = SideCashEnrollmentAdvertisementFeatureWidget(bloc: SideCashEnrollmentBloc(),);
      await tester.pumpWidget(widget);
      expect(find.byType(SideCashEnrollmentAdvertisementPresenter), findsOneWidget);

    });


  });


}