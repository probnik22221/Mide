//экран осознания
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
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = 16.0;
    final spacing = 16.0;
    final cardSize = (screenWidth - 2 * padding - spacing) / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.awareness ?? 'Awareness'),
        actions: const [LanguageSwitcher()],
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            // Первая строка карточек
            Expanded(
              child: Row(
                children: [
                  _buildCategoryCard(
                    context,
                    title: localizations?.selfAwareness ?? 'Self-awareness',
                    icon: Icons.person,
                    color: Colors.blue,
                    routeName: '/self_awareness',
                    size: cardSize,
                  ),
                  SizedBox(width: spacing),
                  _buildCategoryCard(
                    context,
                    title: localizations?.worldAwareness ?? 'World awareness',
                    icon: Icons.public,
                    color: Colors.green,
                    routeName: '/world_awareness',
                    size: cardSize,
                  ),
                ],
              ),
            ),
            SizedBox(height: spacing),
            // Вторая строка карточек
            Expanded(
              child: Row(
                children: [
                  _buildCategoryCard(
                    context,
                    title: localizations?.peopleAwareness ?? 'People awareness',
                    icon: Icons.people,
                    color: Colors.purple,
                    routeName: '/people_awareness',
                    size: cardSize,
                  ),
                  SizedBox(width: spacing),
                  _buildCategoryCard(
                    context,
                    title: localizations?.shareThoughts ?? 'Share thoughts',
                    icon: Icons.edit,
                    color: Colors.orange,
                    routeName: '/diary',
                    size: cardSize,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Color color,
        required String routeName,
        required double size,
      }) {
    return Expanded(
      child: CategoryCard(
        title: title,
        icon: icon,
        color: color,
        onTap: () => Navigator.pushNamed(context, routeName),
      ),
    );
  }
}
