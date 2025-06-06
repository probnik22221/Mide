import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mide/utils/localization.dart';
import 'package:mide/widgets/language_switcher.dart';

import '../../l10n/app_localizations.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  final TextEditingController _diaryController = TextEditingController();
  final List<DiaryEntry> _entries = [];
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isRussian = Localizations.localeOf(context).languageCode == 'ru';
    final dateFormat = isRussian ? 'dd.MM.yyyy' : 'MM/dd/yyyy';

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.diary ?? 'Diary'),
        actions: const [LanguageSwitcher()],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat(dateFormat).format(_selectedDate),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: _pickDate,
                ),
              ],
            ),
          ),
          Expanded(
            child: _entries.isEmpty
                ? Center(
              child: Text(
                localizations?.noEntries ?? 'No diary entries yet',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _entries.length,
              itemBuilder: (context, index) {
                final entry = _entries[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('HH:mm').format(entry.date),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 8),
                        Text(entry.text),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _diaryController,
                    decoration: InputDecoration(
                      hintText: localizations?.writeYourThoughts ?? 'Write your thoughts...',
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _addEntry,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _addEntry() {
    if (_diaryController.text.trim().isEmpty) return;

    setState(() {
      _entries.add(DiaryEntry(
        date: DateTime.now(),
        text: _diaryController.text,
      ));
      _diaryController.clear();
    });
  }

  @override
  void dispose() {
    _diaryController.dispose();
    super.dispose();
  }
}

class DiaryEntry {
  final DateTime date;
  final String text;

  DiaryEntry({required this.date, required this.text});
}
