//экран окружение


import 'package:flutter/material.dart';
import 'package:mide/screens/victimScreen.dart';

import '../l10n/app_localizations.dart';
import '../widgets/category_card.dart';
import '../widgets/language_switcher.dart';
import 'boundariesScreen.dart';
import 'devalueScreen.dart';
import 'dontBelieveScreen.dart';



class EnvironmentScreen extends StatelessWidget {
  const EnvironmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.environment ?? 'Environment'),
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
              title: localizations?.dontBelieve ?? "People who don't believe in you",
              icon: Icons.thumb_down,
              color: Colors.red,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DontBelieveScreen(localizations: localizations),
                ),
              ),
            ),
            CategoryCard(
              title: localizations?.boundaries ?? 'People violate boundaries',
              icon: Icons.block,
              color: Colors.orange,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoundariesScreen(localizations: localizations),
                ),
              ),
            ),
            CategoryCard(
              title: localizations?.devalue ?? 'People devalue you',
              icon: Icons.warning,
              color: Colors.purple,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DevalueScreen(localizations: localizations),
                ),
              ),
            ),
            CategoryCard(
              title: localizations?.victim ?? 'You are in victim position',
              icon: Icons.help,
              color: Colors.teal,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VictimScreen(localizations: localizations),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
