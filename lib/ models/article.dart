class Article {
  final String id;
  final String titleEn;
  final String titleRu;
  final String contentEn;
  final String contentRu;
  final String category;
  final DateTime createdAt;

  Article({
    required this.id,
    required this.titleEn,
    required this.titleRu,
    required this.contentEn,
    required this.contentRu,
    required this.category,
    required this.createdAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      titleEn: json['titleEn'],
      titleRu: json['titleRu'],
      contentEn: json['contentEn'],
      contentRu: json['contentRu'],
      category: json['category'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleEn': titleEn,
      'titleRu': titleRu,
      'contentEn': contentEn,
      'contentRu': contentRu,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
