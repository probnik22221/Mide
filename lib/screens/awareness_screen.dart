import 'package:flutter/material.dart';
import 'package:mide/utils/localization.dart';

import '../l10n/app_localizations.dart';
import '../widgets/category_card.dart';
import '../widgets/language_switcher.dart';


class AwarenessScreen extends StatelessWidget {
  const AwarenessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.awareness ?? 'Awareness'),
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
              title: localizations?.selfAwareness ?? 'Self-awareness',
              icon: Icons.person,
              color: Colors.blue,
              onTap: () => _navigateToArticle(context, 'self_awareness'),
            ),
            CategoryCard(
              title: localizations?.worldAwareness ?? 'World awareness',
              icon: Icons.public,
              color: Colors.green,
              onTap: () => _navigateToArticle(context, 'world_awareness'),
            ),
            CategoryCard(
              title: localizations?.peopleAwareness ?? 'People awareness',
              icon: Icons.people,
              color: Colors.purple,
              onTap: () => _navigateToArticle(context, 'people_awareness'),
            ),
            CategoryCard(
              title: localizations?.shareThoughts ?? 'Share thoughts',
              icon: Icons.edit,
              color: Colors.orange,
              onTap: () => _navigateToDiary(context),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToArticle(BuildContext context, String articleId) {
    // Навигация к статье
  }

  void _navigateToDiary(BuildContext context) {
    // Навигация к дневнику
  }
}
