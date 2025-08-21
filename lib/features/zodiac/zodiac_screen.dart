import 'package:flutter/material.dart';

class ZodiacScreen extends StatelessWidget {
  const ZodiacScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Zodiac Signs'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            'Zodiac Screen - Coming Soon',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
