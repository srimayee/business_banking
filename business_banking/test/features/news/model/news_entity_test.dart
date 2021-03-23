import 'package:business_banking/features/news/model/news_entity.dart';
import 'package:business_banking/features/news/model/news_model.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ENTITY TEST: On Success NewsEntity should be initialized', () async {
    final entity = NewsEntity(allNews: [
      NewsModel(
          'author', 'title', 'description', 'url', 'urlToImage', 'publishedAt')
    ]);
    expect(entity.props, [[], entity.allNews]);
    expect(entity.stringify, true);
    expect(entity.allNews.first.author, 'author');
    expect(entity.allNews.first.title, 'title');
    expect(entity.allNews.first.description, 'description');
    expect(entity.allNews.first.url, 'url');
    expect(entity.allNews.first.urlToImage, 'urlToImage');
    expect(entity.allNews.first.publishedAt, 'publishedAt');
    final merged = entity.merge(errors: null);
    expect(merged.errors, []);
  });

  test('ENTITY TEST: Merged with an error', () async {
    final entity = NewsEntity(allNews: [
      NewsModel(
          'author', 'title', 'description', 'url', 'urlToImage', 'publishedAt')
    ]);
    final merged =
        entity.merge(errors: <EntityFailure>[GeneralEntityFailure()]);
    expect(merged.hasErrors(), true);
  });
}
