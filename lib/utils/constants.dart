class AppConstants {
  static const String appName = 'Mide';
  static const String defaultLanguage = 'en';
  static const List<String> supportedLanguages = ['en', 'ru'];

  // API endpoints
  static const String baseUrl = 'https://api.mide.app/v1';
  static const String articlesEndpoint = '$baseUrl/articles';
  static const String testsEndpoint = '$baseUrl/tests';
  static const String quotesEndpoint = '$baseUrl/quotes';
  static const String authEndpoint = '$baseUrl/auth';

  // SharedPreferences keys
  static const String userKey = 'mide_user';
  static const String languageKey = 'mide_language';
  static const String savedArticlesKey = 'mide_saved_articles';
  static const String testResultsKey = 'mide_test_results';

  // Subscription constants
  static const String monthlySubscriptionId = 'mide_monthly';
  static const String yearlySubscriptionId = 'mide_yearly';

  // App colors
  static const int primaryColorValue = 0xFF5C6BC0;
  static const int secondaryColorValue = 0xFF26A69A;
  static const int accentColorValue = 0xFFFF7043;
}
