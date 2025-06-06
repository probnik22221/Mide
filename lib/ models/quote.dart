import 'package:flutter/cupertino.dart';

class Quote {
  final String id;
  final String textEn;
  final String textRu;
  final String authorEn;
  final String authorRu;
  final String category;

  Quote({
    required this.id,
    required this.textEn,
    required this.textRu,
    required this.authorEn,
    required this.authorRu,
    required this.category,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      textEn: json['textEn'],
      textRu: json['textRu'],
      authorEn: json['authorEn'],
      authorRu: json['authorRu'],
      category: json['category'],
    );
  }

  String getText(BuildContext context) {
    final isRussian = Localizations.localeOf(context).languageCode == 'ru';
    return isRussian ? textRu : textEn;
  }

  String getAuthor(BuildContext context) {
    final isRussian = Localizations.localeOf(context).languageCode == 'ru';
    return isRussian ? authorRu : authorEn;
  }
}
