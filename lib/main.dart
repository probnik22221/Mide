import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mide/screens/%20home/diary_screen.dart';
import 'package:mide/screens/awareness_screen.dart';
import 'package:mide/screens/new_entry_screen.dart' show NewEntryScreen;
import 'package:mide/screens/people_awareness_screen.dart';
import 'package:mide/screens/self_awareness_screen.dart';
import 'package:mide/screens/world_awareness_screen.dart';
import 'package:mide/utils/theme.dart';
import 'package:mide/widgets/auth_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/app_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final languageCode = prefs.getString('language') ?? 'en';

  runApp(MyApp(locale: Locale(languageCode)));
}

class MyApp extends StatefulWidget {
  final Locale locale;

  const MyApp({super.key, required this.locale});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.locale;
  }

  void setLocale(Locale newLocale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', newLocale.languageCode);

    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mide',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const AuthWrapper(),
      // Добавляем именованные маршруты для экранов осознанности
      routes: {
        '/awareness': (context) => const AwarenessScreen(),
        '/self_awareness': (context) => const SelfAwarenessScreen(),
        '/world_awareness': (context) => const WorldAwarenessScreen(),
        '/people_awareness': (context) => const PeopleAwarenessScreen(),
        '/diary': (context) => const DiaryScreen(),
        '/new_entry': (context) => const NewEntryScreen(),
      },
      // Улучшаем анимации переходов между страницами
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/awareness':
            return CupertinoPageRoute(
              builder: (context) => const AwarenessScreen(),
              settings: settings,
            );
          case '/self_awareness':
            return CupertinoPageRoute(
              builder: (context) => const SelfAwarenessScreen(),
              settings: settings,
            );
          case '/world_awareness':
            return CupertinoPageRoute(
              builder: (context) => const WorldAwarenessScreen(),
              settings: settings,
            );
          case '/people_awareness':
            return CupertinoPageRoute(
              builder: (context) => const PeopleAwarenessScreen(),
              settings: settings,
            );
          case '/diary':
            return CupertinoPageRoute(
              builder: (context) => const DiaryScreen(),
              settings: settings,
            );
          case '/new_entry':
            return CupertinoPageRoute(
              builder: (context) => const NewEntryScreen(),
              settings: settings,
            );
          default:
            return null;
        }
      },
      // Настраиваем стандартное поведение для неизвестных маршрутов
      onUnknownRoute: (settings) => CupertinoPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text(
                AppLocalizations.of(context)?.pageNotFound ?? 'Page not found'),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
