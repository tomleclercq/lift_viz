import 'package:flutter/material.dart';
import 'package:lift_viz/orchestrator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Orchestrator(),
      ),
    );
  }
}
