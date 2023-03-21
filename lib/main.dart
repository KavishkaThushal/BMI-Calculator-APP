import 'package:flutter/material.dart';
import 'components/input.dart';

void main() => runApp(const BmiApp());

class BmiApp extends StatelessWidget {
  const BmiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        colorScheme:
        ColorScheme.fromSwatch().copyWith(primary: const Color(0xFF12153B)),
        scaffoldBackgroundColor: const Color(0xFF12153B),
      ),
      home: const Input(),
    );
  }
}


