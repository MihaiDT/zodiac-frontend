import 'package:flutter/material.dart';

class NumerologyScreen extends StatelessWidget {
  const NumerologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Numerology'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            'Numerology Screen - Coming Soon',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
