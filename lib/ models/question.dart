import 'option.dart';

class Question {
  final String questionEn;
  final String questionRu;
  final List<Option> options;

  Question({
    required this.questionEn,
    required this.questionRu,
    required this.options,
  });
}
