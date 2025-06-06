class User {
  final String id;
  final String name;
  final String email;
  final bool hasSubscription;
  final DateTime? subscriptionExpiry;
  final String? profileImage;
  final List<String> savedArticles;
  final List<String> completedTests;
  final String language;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.hasSubscription = false,
    this.subscriptionExpiry,
    this.profileImage,
    this.savedArticles = const [],
    this.completedTests = const [],
    this.language = 'en',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      hasSubscription: json['hasSubscription'],
      subscriptionExpiry: json['subscriptionExpiry'] != null
          ? DateTime.parse(json['subscriptionExpiry'])
          : null,
      profileImage: json['profileImage'],
      savedArticles: List<String>.from(json['savedArticles']),
      completedTests: List<String>.from(json['completedTests']),
      language: json['language'] ?? 'en',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'hasSubscription': hasSubscription,
      'subscriptionExpiry': subscriptionExpiry?.toIso8601String(),
      'profileImage': profileImage,
      'savedArticles': savedArticles,
      'completedTests': completedTests,
      'language': language,
    };
  }
}
