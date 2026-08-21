import 'package:flutter/material.dart';

class FastingPage extends StatefulWidget {
  const FastingPage({super.key});

  @override
  State<FastingPage> createState() => _FastingPageState();
}

class _FastingPageState extends State<FastingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Fasting Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}