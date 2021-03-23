import 'package:business_banking/features/news/model/news_model.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:business_banking/features/news/ui/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomerDetailWidget, with true bloc', (tester) async {
    final viewModel = NewsViewModel([
      NewsModel(
          'author', 'title', 'description', 'url', '', 'publishedAt')
    ]);
    final testWidget = MaterialApp(home: NewsScreen(viewModel: viewModel));
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(Card), findsNWidgets(2));
  });
}
