import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mide/screens/%20home/home_screen.dart';


import 'package:mide/screens/auth/login_screen.dart';
import 'package:mide/l10n/app_localizations.dart';
import 'package:mide/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Получаем сохраненный язык (если есть)
  final prefs = await SharedPreferences.getInstance();
  final languageCode = prefs.getString('language') ?? 'en';

  runApp(MyApp(locale: Locale(languageCode)));
}

class MyApp extends StatelessWidget {
  final Locale locale;

  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mide',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: locale, // Устанавливаем начальную локаль
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _isAuthenticated = false;
  String? _userName;

  @override
  void initState() {
    super.initState();
    _checkAuthState();
  }

  Future<void> _checkAuthState() async {
    // Здесь должна быть реальная проверка авторизации
    await Future.delayed(const Duration(seconds: 1));

    // Для примера - всегда показываем экран входа
    setState(() {
      _isAuthenticated = false;
    });
  }

  void _handleLoginSuccess(String userName) {
    setState(() {
      _isAuthenticated = true;
      _userName = userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isAuthenticated
        ? HomeScreen(userName: _userName)
        : LoginScreen(onLoginSuccess: _handleLoginSuccess);
  }
}
