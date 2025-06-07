//нарушают твои границы



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class BoundariesScreen extends StatelessWidget {
  final AppLocalizations? localizations;

  const BoundariesScreen({super.key, required this.localizations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.boundaries ?? 'People violate boundaries'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations?.boundariesDescription ??
                  """Boundary violations can leave you feeling disrespected and uncomfortable. Healthy boundaries are essential for your well-being.

1. Clearly communicate your boundaries
2. Be consistent in enforcing them
3. Recognize early warning signs
4. Don't feel guilty for saying no
5. Distance yourself from repeat offenders""",
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
