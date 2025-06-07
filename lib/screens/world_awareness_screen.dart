//экран микровосприятия
import 'package:flutter/material.dart';

class WorldAwarenessScreen extends StatelessWidget {
  const WorldAwarenessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('World Awareness')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Global Perspective',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Developing world awareness helps you:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text('• Understand global interconnectedness'),
              Text('• Recognize cultural differences and similarities'),
              Text('• Stay informed about world events'),
              Text('• Develop environmental consciousness'),
              SizedBox(height: 24),
              Divider(),
              SizedBox(height: 16),
              Text(
                'How to Cultivate:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text('1. Follow international news from diverse sources'),
              Text('2. Learn about different cultures and histories'),
              Text('3. Travel when possible (or virtual travel)'),
              Text('4. Reduce your ecological footprint'),
            ],
          ),
        ),
      ),
    );
  }
}
