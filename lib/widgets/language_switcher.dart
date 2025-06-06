import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);

    return PopupMenuButton(
      icon: const Icon(Icons.language),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'en',
          child: Row(
            children: [
              const Text('English'),
              if (currentLocale.languageCode == 'en')
                const Icon(Icons.check, size: 20),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'ru',
          child: Row(
            children: [
              const Text('Русский'),
              if (currentLocale.languageCode == 'ru')
                const Icon(Icons.check, size: 20),
            ],
          ),
        ),
      ],
      onSelected: (languageCode) async {
        // Сохраняем выбор языка
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('language', languageCode);

        // Перезапускаем приложение с новым языком
        if (context.mounted) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => MyApp(locale: Locale(languageCode)),
            ),
                (route) => false,
          );
        }
      },
    );
  }
}
