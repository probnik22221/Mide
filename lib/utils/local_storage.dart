import '../ models/article.dart';
import '../ models/user.dart';

abstract class LocalStorage {
  Future<void> saveUser(User user);
  Future<User?> getUser();
  Future<void> clearUser();
  Future<void> saveLanguage(String language);
  Future<String> getLanguage();
  Future<void> saveArticle(Article article);
  Future<List<Article>> getSavedArticles();
  Future<void> removeArticle(String articleId);
  Future<void> saveTestResult(String testId, int score);
  Future<Map<String, int>> getTestResults();
}
