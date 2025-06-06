import 'package:flutter/material.dart';
import 'package:mide/utils/localization.dart';
import '../ models/quote.dart';
import '../l10n/app_localizations.dart';

class DailyQuote extends StatefulWidget {
  const DailyQuote({super.key});

  @override
  State<DailyQuote> createState() => _DailyQuoteState();
}

class _DailyQuoteState extends State<DailyQuote> {
  Quote? _currentQuote;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDailyQuote();
  }

  Future<void> _loadDailyQuote() async {
    // В реальном приложении здесь будет запрос к сервису
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _currentQuote = Quote(
        id: '1',
        textEn: "The only way to do great work is to love what you do.",
        textRu: "Единственный способ делать великую работу — любить то, что ты делаешь.",
        authorEn: "Steve Jobs",
        authorRu: "Стив Джобс",
        category: "work",
      );
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isRussian = Localizations.localeOf(context).languageCode == 'ru';

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.format_quote, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  localizations?.quoteOfTheDay ?? 'Quote of the day',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_currentQuote != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isRussian ? _currentQuote!.textRu : _currentQuote!.textEn,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '— ${isRussian ? _currentQuote!.authorRu : _currentQuote!.authorEn}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: _loadDailyQuote,
                tooltip: localizations?.refreshQuote ?? 'Refresh quote',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
