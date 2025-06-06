class Test {
  final String id;
  final String titleEn;
  final String titleRu;
  final String descriptionEn;
  final String descriptionRu;
  final List<TestQuestion> questions;
  final String resultDescriptionEn;
  final String resultDescriptionRu;

  Test({
    required this.id,
    required this.titleEn,
    required this.titleRu,
    required this.descriptionEn,
    required this.descriptionRu,
    required this.questions,
    required this.resultDescriptionEn,
    required this.resultDescriptionRu,
  });

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      id: json['id'],
      titleEn: json['titleEn'],
      titleRu: json['titleRu'],
      descriptionEn: json['descriptionEn'],
      descriptionRu: json['descriptionRu'],
      questions: (json['questions'] as List)
          .map((q) => TestQuestion.fromJson(q))
          .toList(),
      resultDescriptionEn: json['resultDescriptionEn'],
      resultDescriptionRu: json['resultDescriptionRu'],
    );
  }
}

class TestQuestion {
  final String questionEn;
  final String questionRu;
  final List<TestOption> options;

  TestQuestion({
    required this.questionEn,
    required this.questionRu,
    required this.options,
  });

  factory TestQuestion.fromJson(Map<String, dynamic> json) {
    return TestQuestion(
      questionEn: json['questionEn'],
      questionRu: json['questionRu'],
      options: (json['options'] as List)
          .map((o) => TestOption.fromJson(o))
          .toList(),
    );
  }
}

class TestOption {
  final String optionEn;
  final String optionRu;
  final int score;

  TestOption({
    required this.optionEn,
    required this.optionRu,
    required this.score,
  });

  factory TestOption.fromJson(Map<String, dynamic> json) {
    return TestOption(
      optionEn: json['optionEn'],
      optionRu: json['optionRu'],
      score: json['score'],
    );
  }
}
