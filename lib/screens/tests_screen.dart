import 'package:flutter/material.dart';
import 'package:mide/screens/test_result_screen.dart';
import 'package:mide/widgets/language_switcher.dart';
import '../ models/test.dart';

import '../l10n/app_localizations.dart';

class TestScreen extends StatefulWidget {
  final Test test;

  const TestScreen({super.key, required this.test});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _currentQuestionIndex = 0;
  late List<int?> _answers;

  @override
  void initState() {
    super.initState();
    _answers = List.filled(widget.test.questions.length, null);
  }

  void _goToPreviousQuestion() {
    setState(() {
      _currentQuestionIndex--;
    });
  }

  void _goToNextQuestion() {
    setState(() {
      _currentQuestionIndex++;
    });
  }

  void _completeTest() {
    final score = _answers.fold<int>(0, (sum, answer) => sum + (answer ?? 0));
    final maxScore = widget.test.questions.length * 3; // Assuming 4 answer options

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TestResultScreen(
          test: widget.test,
          score: score,
          maxScore: maxScore,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isRussian = Localizations.localeOf(context).languageCode == 'ru';
    final question = widget.test.questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(isRussian ? widget.test.titleRu : widget.test.titleEn),
        actions: const [LanguageSwitcher()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / widget.test.questions.length,
            ),
            const SizedBox(height: 20),
            Text(
              '${_currentQuestionIndex + 1}/${widget.test.questions.length}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
            Text(
              isRussian ? question.questionRu : question.questionEn,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  final option = question.options[index];
                  return Card(
                    elevation: _answers[_currentQuestionIndex] == index ? 4 : 1,
                    child: RadioListTile<int>(
                      title: Text(isRussian ? option.optionRu : option.optionEn),
                      value: index,
                      groupValue: _answers[_currentQuestionIndex],
                      onChanged: (value) {
                        setState(() {
                          _answers[_currentQuestionIndex] = value;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentQuestionIndex > 0)
                  ElevatedButton(
                    onPressed: _goToPreviousQuestion,
                    child: Text(localizations?.previous ?? 'Previous'),
                  ),
                const SizedBox(width: 10),
                if (_currentQuestionIndex < widget.test.questions.length - 1)
                  ElevatedButton(
                    onPressed: _answers[_currentQuestionIndex] != null
                        ? _goToNextQuestion
                        : null,
                    child: Text(localizations?.next ?? 'Next'),
                  ),
                if (_currentQuestionIndex == widget.test.questions.length - 1)
                  ElevatedButton(
                    onPressed: _answers[_currentQuestionIndex] != null
                        ? _completeTest
                        : null,
                    child: Text(localizations?.complete ?? 'Complete'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
