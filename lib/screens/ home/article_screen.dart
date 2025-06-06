import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mide/utils/localization.dart';
import 'package:mide/widgets/language_switcher.dart';

import '../../ models/article.dart';
import '../../l10n/app_localizations.dart';

class ArticleScreen extends StatelessWidget {
  final String articleId;

  const ArticleScreen({super.key, required this.articleId});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isRussian = Localizations.localeOf(context).languageCode == 'ru';

    // В реальном приложении здесь будет загрузка статьи по ID
    final article = Article(
      id: articleId,
      titleEn: 'Article about $articleId',
      titleRu: 'Статья о $articleId',
      contentEn: '''
This is a detailed article about $articleId. It contains useful information and tips.
        
1. First important point
2. Second valuable insight
3. Practical advice
4. Conclusion and summary
      ''',
      contentRu: '''
Это подробная статья о $articleId. Она содержит полезную информацию и советы.
        
1. Первый важный пункт
2. Второе ценное наблюдение
3. Практический совет
4. Выводы и заключение""      ''',       category: 'general', // Указана категория по умолчанию
       createdAt: DateTime.now(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(isRussian ? article.titleRu : article.titleEn),
        actions: const [LanguageSwitcher()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isRussian ? article.contentRu : article.contentEn,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            Text(
              localizations?.shareArticle ?? 'Share this article:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () => _shareArticle(context),
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark),
                  onPressed: () => _saveArticle(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _shareArticle(BuildContext context) {
    // Логика поделиться статьей
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)?.articleShared ?? 'Article shared!')),
    );
  }

  void _saveArticle(BuildContext context) {
    // Логика сохранения статьи
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)?.articleSaved ?? 'Article saved!')),
    );
  }
}
