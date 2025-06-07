import 'package:flutter/cupertino.dart';

import '../screens/ home/home_screen.dart';
import '../screens/auth/login_screen.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _isLoggedIn = false;
  String? _userName;

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    // Здесь ваша логика проверки авторизации
    // Например, чтение из SharedPreferences
    await Future.delayed(const Duration(milliseconds: 300));

    setState(() {
      _isLoggedIn = true; // Или false в зависимости от проверки
      _userName = "Test User"; // Получаем из хранилища
    });
  }

  void _onLoginSuccess(String name) {
    setState(() {
      _isLoggedIn = true;
      _userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn
        ? HomeScreen(userName: _userName)
        : LoginScreen(onLoginSuccess: _onLoginSuccess);
  }
}
