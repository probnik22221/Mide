import 'package:flutter/material.dart';


import '../l10n/app_localizations.dart';
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
              Text(AppLocalizations.of(context)!.english),
              if (currentLocale.languageCode == 'en')
                const Icon(Icons.check, size: 20),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'ru',
          child: Row(
            children: [
              Text(AppLocalizations.of(context)!.russian),
              if (currentLocale.languageCode == 'ru')
                const Icon(Icons.check, size: 20),
            ],
          ),
        ),
      ],
      onSelected: (languageCode) {
        MyApp.of(context)?.setLocale(Locale(languageCode));
      },
    );
  }
}
