

import '../ models/article.dart';
import '../ models/quote.dart';
import '../ models/test.dart';

abstract class ContentService {
  Future<List<Article>> getArticlesByCategory(String category);
  Future<Article?> getArticleById(String id);
  Future<List<Test>> getAllTests();
  Future<Test?> getTestById(String id);
  Future<Quote> getDailyQuote();
  Future<List<Article>> searchArticles(String query);
  Future<List<Test>> searchTests(String query);
}
