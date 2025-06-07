import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mide/screens/tests_screen.dart';

import '../ models/test.dart';

class TestListScreen extends StatelessWidget {
  final List<Test> tests = [
    Test(
      titleEn: "Stress Test",
      titleRu: "Тест на стресс", id: '', descriptionEn: '', descriptionRu: '', questions: [], resultDescriptionEn: '', resultDescriptionRu: '',

    ),
    Test(
      titleEn: "Personality Test",
      titleRu: "Тест личности", id: '', descriptionEn: '', descriptionRu: '', questions: [], resultDescriptionEn: '', resultDescriptionRu: '',

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Доступные тесты")),
      body: ListView.builder(
        itemCount: tests.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(tests[index].titleRu), // или titleEn, в зависимости от языка
          onTap: () => Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (context) => TestScreen(test: tests[index]),
            ),
          ),
        ),
      ),
    );
  }
}
