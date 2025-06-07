//социальное осознание
import 'package:flutter/material.dart';

class PeopleAwarenessScreen extends StatelessWidget {
  const PeopleAwarenessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('People Awareness')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Social Intelligence',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Key aspects of people awareness:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text('• Empathy - understanding others\' feelings'),
              Text('• Active listening skills'),
              Text('• Recognizing social dynamics'),
              Text('• Cultural sensitivity'),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Development Tips:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text('1. Practice observing body language'),
              Text('2. Engage in diverse social interactions'),
              Text('3. Read literature about human psychology'),
              Text('4. Volunteer in community activities'),
            ],
          ),
        ),
      ),
    );
  }
}
