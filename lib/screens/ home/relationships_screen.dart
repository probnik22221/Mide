import 'package:flutter/material.dart';
import 'package:mide/utils/localization.dart';

import 'package:mide/widgets/language_switcher.dart';

import '../../l10n/app_localizations.dart';
import '../../widgets/category_card.dart';
import 'article_screen.dart';

class RelationshipsScreen extends StatelessWidget {
  const RelationshipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.relationships ?? 'Relationships'),
        actions: const [LanguageSwitcher()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            CategoryCard(
              title: localizations?.socialRelationships ?? 'Social relationships',
              icon: Icons.group,
              color: Colors.blue,
              onTap: () => _navigateToArticle(context, 'social_relationships'),
            ),
            CategoryCard(
              title: localizations?.personalRelationships ?? 'Personal relationships',
              icon: Icons.favorite,
              color: Colors.pink,
              onTap: () => _navigateToArticle(context, 'personal_relationships'),
            ),
            CategoryCard(
              title: localizations?.familyRelationships ?? 'Family relationships',
              icon: Icons.family_restroom,
              color: Colors.purple,
              onTap: () => _navigateToArticle(context, 'family_relationships'),
            ),
            CategoryCard(
              title: localizations?.workRelationships ?? 'Work relationships',
              icon: Icons.work,
              color: Colors.orange,
              onTap: () => _navigateToArticle(context, 'work_relationships'),
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
