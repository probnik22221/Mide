import 'package:flutter/material.dart';
import 'package:mide/utils/localization.dart';
import 'package:mide/widgets/language_switcher.dart';

import '../../l10n/app_localizations.dart';

class SubscriptionScreen extends StatelessWidget {
  final String userName;
  final VoidCallback onSubscribeSuccess;

  const SubscriptionScreen({
    super.key,
    required this.userName,
    required this.onSubscribeSuccess,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations?.subscription ?? 'Subscription'),
        actions: const [LanguageSwitcher()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${localizations?.hello}, $userName!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Text(
              localizations?.subscribeBenefits ?? 'Subscribe to get full access:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            _buildSubscriptionOption(
              context,
              title: localizations?.monthlySubscription ?? 'Monthly',
              price: '\$9.99',
              onTap: () => _handleSubscription(context),
            ),
            const SizedBox(height: 20),
            _buildSubscriptionOption(
              context,
              title: localizations?.yearlySubscription ?? 'Yearly',
              price: '\$89.99',
              isBestValue: true,
              onTap: () => _handleSubscription(context),
            ),
            const SizedBox(height: 30),
            Text(
              localizations?.subscriptionFeatures ?? 'All subscriptions include:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            _buildFeatureRow(
              localizations?.unlimitedTests ?? 'Unlimited tests',
              Icons.quiz,
            ),
            _buildFeatureRow(
              localizations?.allArticles ?? 'All articles',
              Icons.article,
            ),
            _buildFeatureRow(
              localizations?.personalDiary ?? 'Personal diary',
              Icons.edit,
            ),
            const Spacer(),
            TextButton(
              onPressed: () => onSubscribeSuccess(),
              child: Text(
                localizations?.maybeLater ?? 'Maybe later',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionOption(
      BuildContext context, {
        required String title,
        required String price,
        bool isBestValue = false,
        required VoidCallback onTap,
      }) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isBestValue)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    AppLocalizations.of(context)?.bestValue ?? 'Best value',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                AppLocalizations.of(context)?.perMonth ?? '/month',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }

  void _handleSubscription(BuildContext context) {
    // Обработка подписки
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)?.subscriptionSuccess ?? 'Subscription successful!')),
    );
    onSubscribeSuccess();
  }
}
