import 'package:flutter/material.dart';
import 'package:mide/screens/%20home/relationships_screen.dart';
import 'package:mide/screens/%20home/work_screen.dart';
import 'package:mide/screens/tests_screen.dart';
import '../../ models/option.dart';
import '../../ models/test.dart';

import '../../l10n/app_localizations.dart';
import '../../widgets/category_card.dart';
import '../../widgets/daily_quote.dart';
import '../../widgets/language_switcher.dart';
import '../about_screen.dart';
import '../awareness_screen.dart';
import '../environment_screen.dart';

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
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineSmall,
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AwarenessScreen()),
    );
  }

  void _navigateToEnvironment(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EnvironmentScreen()),
    );
  }

  void _navigateToRelationships(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RelationshipsScreen()),
    );
  }

  void _navigateToWork(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WorkScreen()),
    );
  }

  void _navigateToAbout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutScreen()),
    );
  }

  void _navigateToTests(BuildContext context) {
    final demoTest = Test(
      id: 'personality_test_1',
      titleEn: "Personality Test",
      titleRu: "Тест личности",
      descriptionEn: "This test will help you understand your personality traits",
      descriptionRu: "Этот тест поможет вам понять свои личностные черты",
      resultDescriptionEn: "Based on your answers, we can determine...",
      resultDescriptionRu: "На основе ваших ответов мы можем определить...",
      questions: [
        TestQuestion(
          questionEn: "How often do you feel stressed?",
          questionRu: "Как часто вы чувствуете стресс?",
          options: [
            TestOption(optionEn: "Never", optionRu: "Никогда", score: 0),
            TestOption(optionEn: "Sometimes", optionRu: "Иногда", score: 1),
            TestOption(optionEn: "Often", optionRu: "Часто", score: 2),
            TestOption(optionEn: "Always", optionRu: "Постоянно", score: 3),
          ],
        ),
        TestQuestion(
          questionEn: "How do you relax?",
          questionRu: "Как вы расслабляетесь?",
          options: [
            TestOption(optionEn: "Reading", optionRu: "Чтение", score: 0),
            TestOption(optionEn: "Sports", optionRu: "Спорт", score: 1),
            TestOption(optionEn: "Music", optionRu: "Музыка", score: 2),
            TestOption(optionEn: "Other", optionRu: "Другое", score: 3),
          ],
        ),
      ],
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TestScreen(test: demoTest)),
    );
  }
}
