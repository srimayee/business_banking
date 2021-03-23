import 'package:business_banking/features/news/model/news_details_view_model.dart';
import 'package:business_banking/features/news/ui/news_details_screen.dart';
import 'package:business_banking/features/news/ui/widgets/news_row_widget.dart';
import 'package:business_banking/features/news/ui/widgets/text_content_widget.dart';
import 'package:business_banking/features/news/ui/widgets/thumb_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('NewsRowWidget, with view model', (tester) async {
    final mockObserver = MockNavigatorObserver();
    final viewModel = NewsDetailsViewModel(
        author: 'author',
        title: 'title',
        description: 'description',
        url: 'url',
        urlToImage: '',
        publishedAt: '2021-03-22T14:26:50Z');
    final disclosureAction = find.byKey(Key('disclosureAction'));
    final testWidget = MaterialApp(home: Scaffold(body: NewsRowWidget(viewModel: viewModel,)),
    navigatorObservers: [mockObserver],);
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(ThumbImageCard), findsNWidgets(1));
    expect(find.byType(TextContentWidget), findsNWidgets(2));
    expect(find.byType(Icon), findsNWidgets(1));
    expect(find.byType(Row), findsNWidgets(1));
    expect(find.byType(InkWell), findsNWidgets(1));
    expect(disclosureAction, findsOneWidget);

    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    verify(mockObserver.didPush(any, any));
    expect(find.byType(NewsDetailsScreen), findsOneWidget);
  });
}
