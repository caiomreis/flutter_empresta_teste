// ignore_for_file: must_be_immutable

import 'package:desktop/view/SimuladorApp/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SimulatorApp(),
    );
  }
}
