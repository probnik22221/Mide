import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../widgets/category_card.dart';
import '../../widgets/daily_quote.dart';
import '../../widgets/language_switcher.dart';


class HomeScreen extends StatelessWidget {
  final String? userName;

  const HomeScreen({super.key, this.userName});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.welcome ?? 'Mide'),
        actions: const [LanguageSwitcher()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (userName != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  '${localizations?.hello}, $userName!',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            const DailyQuote(),
            const SizedBox(height: 24),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                CategoryCard(
                  title: localizations?.awareness ?? 'Awareness',
                  icon: Icons.self_improvement,
                  color: Colors.blue,
                  onTap: () => _navigateToAwareness(context),
                ),
                CategoryCard(
                  title: localizations?.environment ?? 'Environment',
                  icon: Icons.people,
                  color: Colors.green,
                  onTap: () => _navigateToEnvironment(context),
                ),
                CategoryCard(
                  title: localizations?.relationships ?? 'Relationships',
                  icon: Icons.favorite,
                  color: Colors.purple,
                  onTap: () => _navigateToRelationships(context),
                ),
                CategoryCard(
                  title: localizations?.work ?? 'Work',
                  icon: Icons.work,
                  color: Colors.orange,
                  onTap: () => _navigateToWork(context),
                ),
                CategoryCard(
                  title: localizations?.tests ?? 'Tests',
                  icon: Icons.quiz,
                  color: Colors.red,
                  onTap: () => _navigateToTests(context),
                ),
                CategoryCard(
                  title: localizations?.about ?? 'About',
                  icon: Icons.info,
                  color: Colors.teal,
                  onTap: () => _navigateToAbout(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAwareness(BuildContext context) {
    // Навигация к разделу осознанности
  }

  void _navigateToEnvironment(BuildContext context) {
    // Навигация к разделу окружения
  }

  void _navigateToRelationships(BuildContext context) {
    // Навигация к разделу отношений
  }

  void _navigateToWork(BuildContext context) {
    // Навигация к разделу работы
  }

  void _navigateToTests(BuildContext context) {
    // Навигация к разделу тестов
  }

  void _navigateToAbout(BuildContext context) {
    // Навигация к разделу "О приложении"
  }
}
