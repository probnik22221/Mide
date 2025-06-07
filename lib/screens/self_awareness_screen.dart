// экран самоосознанности
import 'package:flutter/material.dart';

class SelfAwarenessScreen extends StatelessWidget {
  const SelfAwarenessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Self-Awareness')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Understanding Yourself',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Self-awareness is the foundation of personal growth. It involves:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text('• Recognizing your emotions and triggers'),
              Text('• Understanding your strengths and weaknesses'),
              Text('• Knowing your values and beliefs'),
              Text('• Being aware of how others perceive you'),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Practical Exercises:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text('1. Daily journaling - reflect on your thoughts and actions'),
              Text('2. Meditation - observe your mind without judgment'),
              Text('3. Personality tests (MBTI, Enneagram, etc.)'),
              Text('4. Ask for honest feedback from trusted people'),
            ],
          ),
        ),
      ),
    );
  }
}
