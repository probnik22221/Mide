import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Mide'**
  String get welcome;

  /// No description provided for @mideDescription.
  ///
  /// In en, this message translates to:
  /// **'Your personal psychological assistant'**
  String get mideDescription;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get enterName;

  /// No description provided for @registration.
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get registration;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get nameRequired;

  /// No description provided for @awareness.
  ///
  /// In en, this message translates to:
  /// **'Awareness'**
  String get awareness;

  /// No description provided for @environment.
  ///
  /// In en, this message translates to:
  /// **'Environment'**
  String get environment;

  /// No description provided for @relationships.
  ///
  /// In en, this message translates to:
  /// **'Relationships'**
  String get relationships;

  /// No description provided for @work.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get work;

  /// No description provided for @tests.
  ///
  /// In en, this message translates to:
  /// **'Tests'**
  String get tests;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @selfAwareness.
  ///
  /// In en, this message translates to:
  /// **'Self-awareness'**
  String get selfAwareness;

  /// No description provided for @worldAwareness.
  ///
  /// In en, this message translates to:
  /// **'World awareness'**
  String get worldAwareness;

  /// No description provided for @peopleAwareness.
  ///
  /// In en, this message translates to:
  /// **'People awareness'**
  String get peopleAwareness;

  /// No description provided for @shareThoughts.
  ///
  /// In en, this message translates to:
  /// **'Share thoughts'**
  String get shareThoughts;

  /// No description provided for @dontBelieve.
  ///
  /// In en, this message translates to:
  /// **'People who don\'t believe in you'**
  String get dontBelieve;

  /// No description provided for @boundaries.
  ///
  /// In en, this message translates to:
  /// **'People violate boundaries'**
  String get boundaries;

  /// No description provided for @devalue.
  ///
  /// In en, this message translates to:
  /// **'People devalue you'**
  String get devalue;

  /// No description provided for @victim.
  ///
  /// In en, this message translates to:
  /// **'You are in victim position'**
  String get victim;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @russian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russian;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Psychology App'**
  String get appTitle;

  /// No description provided for @yourName.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get yourName;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @whatIsYourName.
  ///
  /// In en, this message translates to:
  /// **'What is your name?'**
  String get whatIsYourName;

  /// No description provided for @subscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get subscription;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @subscribeBenefits.
  ///
  /// In en, this message translates to:
  /// **'Subscribe to get full access:'**
  String get subscribeBenefits;

  /// No description provided for @monthlySubscription.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthlySubscription;

  /// No description provided for @yearlySubscription.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get yearlySubscription;

  /// No description provided for @subscriptionFeatures.
  ///
  /// In en, this message translates to:
  /// **'All subscriptions include:'**
  String get subscriptionFeatures;

  /// No description provided for @unlimitedTests.
  ///
  /// In en, this message translates to:
  /// **'Unlimited tests'**
  String get unlimitedTests;

  /// No description provided for @allArticles.
  ///
  /// In en, this message translates to:
  /// **'All articles'**
  String get allArticles;

  /// No description provided for @personalDiary.
  ///
  /// In en, this message translates to:
  /// **'Personal diary'**
  String get personalDiary;

  /// No description provided for @bestValue.
  ///
  /// In en, this message translates to:
  /// **'Best value'**
  String get bestValue;

  /// No description provided for @perMonth.
  ///
  /// In en, this message translates to:
  /// **'/month'**
  String get perMonth;

  /// No description provided for @subscriptionSuccess.
  ///
  /// In en, this message translates to:
  /// **'Subscription successful!'**
  String get subscriptionSuccess;

  /// No description provided for @maybeLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe later'**
  String get maybeLater;

  /// No description provided for @socialRelationships.
  ///
  /// In en, this message translates to:
  /// **'Social relationships'**
  String get socialRelationships;

  /// No description provided for @personalRelationships.
  ///
  /// In en, this message translates to:
  /// **'Personal relationships'**
  String get personalRelationships;

  /// No description provided for @familyRelationships.
  ///
  /// In en, this message translates to:
  /// **'Family relationships'**
  String get familyRelationships;

  /// No description provided for @workRelationships.
  ///
  /// In en, this message translates to:
  /// **'Work relationships'**
  String get workRelationships;

  /// No description provided for @workWithJoy.
  ///
  /// In en, this message translates to:
  /// **'Work with joy'**
  String get workWithJoy;

  /// No description provided for @burnoutAtWork.
  ///
  /// In en, this message translates to:
  /// **'Burnout at work'**
  String get burnoutAtWork;

  /// No description provided for @succeedAtNewJob.
  ///
  /// In en, this message translates to:
  /// **'Succeed at new job'**
  String get succeedAtNewJob;

  /// No description provided for @psychologistTips.
  ///
  /// In en, this message translates to:
  /// **'Psychologist tips'**
  String get psychologistTips;

  /// No description provided for @shareArticle.
  ///
  /// In en, this message translates to:
  /// **'Share this article:'**
  String get shareArticle;

  /// No description provided for @articleShared.
  ///
  /// In en, this message translates to:
  /// **'Article shared!'**
  String get articleShared;

  /// No description provided for @articleSaved.
  ///
  /// In en, this message translates to:
  /// **'Article saved!'**
  String get articleSaved;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @testResults.
  ///
  /// In en, this message translates to:
  /// **'Test results'**
  String get testResults;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get backToHome;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get appVersion;

  /// No description provided for @aboutAppDescription.
  ///
  /// In en, this message translates to:
  /// **'Mide is a psychological assistant application that helps you with self-awareness, relationships, work and personal growth.'**
  String get aboutAppDescription;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'Features:'**
  String get features;

  /// No description provided for @articlesFeature.
  ///
  /// In en, this message translates to:
  /// **'Educational articles'**
  String get articlesFeature;

  /// No description provided for @testsFeature.
  ///
  /// In en, this message translates to:
  /// **'Psychological tests'**
  String get testsFeature;

  /// No description provided for @diaryFeature.
  ///
  /// In en, this message translates to:
  /// **'Personal diary'**
  String get diaryFeature;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us:'**
  String get contactUs;

  /// No description provided for @allRightsReserved.
  ///
  /// In en, this message translates to:
  /// **'© 2023 Mide. All rights reserved.'**
  String get allRightsReserved;

  /// No description provided for @diary.
  ///
  /// In en, this message translates to:
  /// **'Diary'**
  String get diary;

  /// No description provided for @noEntries.
  ///
  /// In en, this message translates to:
  /// **'No diary entries yet'**
  String get noEntries;

  /// No description provided for @writeYourThoughts.
  ///
  /// In en, this message translates to:
  /// **'Write your thoughts...'**
  String get writeYourThoughts;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get invalidEmail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordLength;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordsDontMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDontMatch;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @registrationError.
  ///
  /// In en, this message translates to:
  /// **'Registration failed. Please try again.'**
  String get registrationError;

  /// No description provided for @quoteOfTheDay.
  ///
  /// In en, this message translates to:
  /// **'Quote of the day'**
  String get quoteOfTheDay;

  /// No description provided for @refreshQuote.
  ///
  /// In en, this message translates to:
  /// **'Refresh quote'**
  String get refreshQuote;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
