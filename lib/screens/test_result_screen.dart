import 'package:flutter/material.dart';

import 'package:mide/widgets/language_switcher.dart';

import '../ models/test.dart';
import '../l10n/app_localizations.dart';

class TestResultScreen extends StatelessWidget {
  final Test test;
  final int score;
  final int maxScore;

  const TestResultScreen({
    super.key,
    required this.test,
    required this.score,
    required this.maxScore,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isRussian = Localizations.localeOf(context).languageCode == 'ru';
    final percentage = (score / maxScore * 100).round();

    String resultText;
    Color resultColor;

    if (percentage < 30) {
      resultText = isRussian ? 'Низкий показатель' : 'Low score';
      resultColor = Colors.red;
    } else if (percentage < 70) {
      resultText = isRussian ? 'Средний показатель' : 'Average score';
      resultColor = Colors.orange;
    } else {
      resultText = isRussian ? 'Высокий показатель' : 'High score';
      resultColor = Colors.green;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(isRussian ? test.titleRu : test.titleEn),
        actions: const [LanguageSwitcher()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localizations?.testResults ?? 'Test results',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 30),
            CircularProgressIndicator(
              value: percentage / 100,
              color: resultColor,
              strokeWidth: 10,
              semanticsLabel: 'Test result',
            ),
            const SizedBox(height: 20),
            Text(
              '$percentage%',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: resultColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              resultText,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: resultColor,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              isRussian ? test.resultDescriptionRu : test.resultDescriptionEn,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              child: Text(localizations?.backToHome ?? 'Back to home'),
            ),
          ],
        ),
      ),
    );
  }
}
