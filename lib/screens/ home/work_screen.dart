import 'package:flutter/material.dart';
import 'package:mide/utils/localization.dart';

import 'package:mide/widgets/language_switcher.dart';

import '../../l10n/app_localizations.dart';
import '../../widgets/category_card.dart';
import 'article_screen.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.work ?? 'Work'),
        actions: const [LanguageSwitcher()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CategoryCard(
              title: localizations?.workWithJoy ?? 'Work with joy',
              icon: Icons.emoji_emotions,
              color: Colors.green,
              onTap: () => _navigateToArticle(context, 'work_joy'),
            ),
            const SizedBox(height: 16),
            CategoryCard(
              title: localizations?.burnoutAtWork ?? 'Burnout at work',
              icon: Icons.mood_bad,
              color: Colors.red,
              onTap: () => _navigateToArticle(context, 'burnout'),
            ),
            const SizedBox(height: 16),
            CategoryCard(
              title: localizations?.succeedAtNewJob ?? 'Succeed at new job',
              icon: Icons.star,
              color: Colors.blue,
              onTap: () => _navigateToArticle(context, 'new_job'),
            ),
            const SizedBox(height: 16),
            CategoryCard(
              title: localizations?.psychologistTips ?? 'Psychologist tips for job search',
              icon: Icons.lightbulb,
              color: Colors.purple,
              onTap: () => _navigateToArticle(context, 'job_tips'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToArticle(BuildContext context, String articleId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleScreen(articleId: articleId),
      ),
    );
  }
}
