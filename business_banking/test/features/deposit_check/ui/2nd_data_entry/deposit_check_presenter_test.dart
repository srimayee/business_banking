// @dart=2.9
import 'package:business_banking/features/deposit_check/bloc/deposit_check_bloc.dart';
import 'package:business_banking/features/deposit_check/model/2nd_data_entry/deposit_check_view_model.dart';
import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/deposit_check/ui/2nd_data_entry/deposit_check_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../bloc/deposit_check_bloc_mock.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockForm extends Mock implements GlobalKey<FormState> {}

void main() {
  MaterialApp testWidget;
  DepositCheckBlockMock mockBloc;
  DepositCheckPresenter presenter;
  DepositCheckPressenterActions pressenterActions;
  MockBuildContext mockBuildContext;

  DepositCheckViewModel depositCheckViewModel;
  DepositCheckViewModel depositCheckViewModelOnError;
  setUp(() {
    mockBloc = DepositCheckBlockMock();
    presenter = DepositCheckPresenter();
    pressenterActions = DepositCheckPressenterActions(mockBloc);
    mockBuildContext = MockBuildContext();

    testWidget = MaterialApp(
      home: BlocProvider<DepositCheckBloc>(
        create: (_) => mockBloc,
        child: presenter,
      ),
    );

    final _accountInfo = AccountInfoStruct(
        accountNumber: '1234567890126917',
        availableBalance: 481.84,
        depositLimit: 4500.00,
        accountNickname: 'Checking Account (...6917)');
    depositCheckViewModel = DepositCheckViewModel(
        accountInfo: _accountInfo,
        depositAmount: 200.0,
        frontCheckImg: '',
        backCheckImg: '',
        referenceNumber: '#1',
        userEmail: 'sample@hnb.com',
        depositAmountStatus: '',
        userEmailStatus: '',
        userInputStatus: UserInputStatus.valid);

    depositCheckViewModelOnError = DepositCheckViewModel(
        accountInfo: _accountInfo,
        depositAmount: 0.0,
        frontCheckImg: '',
        backCheckImg: '',
        referenceNumber: '',
        userEmail: '',
        depositAmountStatus: 'Please provide a value.',
        userEmailStatus: 'Please provide a value.',
        userInputStatus: UserInputStatus.invalid);
  });

  tearDown(() {
    mockBloc = null;
    testWidget = null;
  });

  group('Deposit Check', () {
    testWidgets('should shows the presenter', (tester) async {
      // pumpWidget calls runApp, and also triggers a frame to paint the app.
      await tester.pumpWidget(testWidget);
      //pump trigger a rebuild since the data-loading process will happen post-runApp.
      await tester.pump(Duration(milliseconds: 500));

      final widgetType = find.byType(DepositCheckPresenter);
      expect(widgetType, findsOneWidget);
    });

    test(
        'should pressenterActions send event through the pipe on UserEmailSavedListener',
        () async {
      pressenterActions.onUserEmailSavedListener('sample@hnb.com');

      await mockBloc.depositCheckViewModelPipe.receive.listen((event) {
        expect(event, isA<DepositCheckViewModel>());
      });
    });

    test(
        'should pressenterActions send event through the pipe on DepositCheckAmountSavedListener',
        () async {
      pressenterActions.onDepositCheckAmountSavedListener('2500.0');

      await mockBloc.depositCheckViewModelPipe.receive.listen((event) {
        expect(event, isA<DepositCheckViewModel>());
      });
    });

    test(
        'should pressenterActions send event through the pipe on onPickFrontImg',
        () async {
      pressenterActions.onPickFrontImg();

      await mockBloc.depositCheckViewModelPipe.receive.listen((event) {
        expect(event, isA<DepositCheckViewModel>());
      });
    });

    test(
        'should pressenterActions send event through the pipe on onPickBackImg',
        () async {
      pressenterActions.onPickBackImg();

      await mockBloc.depositCheckViewModelPipe.receive.listen((event) {
        expect(event, isA<DepositCheckViewModel>());
      });
    });
    test(
        'should pressenterActions send event through the pipe on onTapConfirmBtn when userInput is valid',
        () async {
      // pressenterActions.onTapConfirmBtn(
      //     mockBuildContext, depositCheckViewModel);

      // await mockBloc.depositCheckViewModelPipe.receive.listen((event) {
      //   expect(event, isA<DepositCheckViewModel>());
      // });
    });
    test(
        'should pressenterActions send event through the pipe on onTapConfirmBtn when userInput is invalid',
        () async {
      // pressenterActions.onTapConfirmBtn(
      //     mockBuildContext, depositCheckViewModelOnError);
      // verify(pressenterActions.showErrorDialog(mockBuildContext)).called(1);
    });
  });
}
