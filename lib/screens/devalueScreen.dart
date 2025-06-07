import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class DevalueScreen extends StatelessWidget {
  final AppLocalizations? localizations;

  const DevalueScreen({super.key, required this.localizations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.devalue ?? 'People devalue you'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations?.devalueDescription ??
                  """When people devalue you, they diminish your worth or contributions. This behavior often says more about them than about you.

1. Recognize your inherent worth
2. Don't internalize others' negativity
3. Seek constructive feedback elsewhere
4. Set limits with people who devalue you
5. Focus on relationships that uplift you""",
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
