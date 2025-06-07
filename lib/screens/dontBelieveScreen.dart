//экран люди не верят в тебя
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class DontBelieveScreen extends StatelessWidget {
  final AppLocalizations? localizations;

  const DontBelieveScreen({super.key, required this.localizations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.dontBelieve ?? "People who don't believe in you"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations?.dontBelieveDescription ??
                  """When people don't believe in you, it can be disheartening and challenging. However, it's important to remember that their lack of belief doesn't define your worth or potential.

1. Focus on your own self-belief
2. Use skepticism as motivation
3. Surround yourself with supportive people
4. Celebrate small victories
5. Remember that success is the best response""",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(localizations?.back ?? 'Back'),
            ),
          ],
        ),
      ),
    );
  }
}
