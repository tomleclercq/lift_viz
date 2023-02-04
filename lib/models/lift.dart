import 'package:flutter/material.dart';

class Lift {
  Lift({
    required this.id,
    required this.name,
    required this.levelCount,
    required this.callback,
  });
  final int id;
  final String name;
  final int levelCount;
  final Function(int, int, int) callback;
  int level = 0;
  int targetLevel = 0;
  bool goingUp = false;
  double height = 0;

  Widget build() {
    return Center(
      child: Column(
        children: [
          Text('Lift: $name'),
          ElevatedButton(
            child: const Text('2'),
            onPressed: () {
              callback(id, level, 2);
            },
          ),
        ],
      ),
    );
  }
}
