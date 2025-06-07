//экран жертвы

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class VictimScreen extends StatelessWidget {
  final AppLocalizations? localizations;

  const VictimScreen({super.key, required this.localizations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.victim ?? 'You are in victim position'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations?.victimDescription ??
                  """Feeling like a victim can be overwhelming, but recognizing this position is the first step toward empowerment.

1. Acknowledge your feelings without judgment
2. Identify what's within your control
3. Take small steps toward change
4. Seek support from trusted individuals
5. Focus on personal growth and resilience""",
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
