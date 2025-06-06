import 'package:flutter/material.dart';

import 'package:mide/widgets/language_switcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.about ?? 'About'),
        actions: const [LanguageSwitcher()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/logo.png',
                height: 120,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Mide',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              localizations?.appVersion ?? 'Version 1.0.0',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 30),
            Text(
              localizations?.aboutAppDescription ??
                  'Mide is a psychological assistant application that helps you with self-awareness, relationships, work and personal growth.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            Text(
              localizations?.features ?? 'Features:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            _buildFeatureItem(localizations?.articlesFeature ?? 'Educational articles'),
            _buildFeatureItem(localizations?.testsFeature ?? 'Psychological tests'),
            _buildFeatureItem(localizations?.diaryFeature ?? 'Personal diary'),
            const SizedBox(height: 30),
            Text(
              localizations?.contactUs ?? 'Contact us:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('support@mide.app'),
              onTap: () => _launchEmail(),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('www.mide.app'),
              onTap: () => _launchWebsite(),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                localizations?.allRightsReserved ?? '© 2023 Mide. All rights reserved.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check, size: 20),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@mide.app',
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  Future<void> _launchWebsite() async {
    final Uri url = Uri.parse('https://www.mide.app');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
