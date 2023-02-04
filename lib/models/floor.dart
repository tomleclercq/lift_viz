import 'package:flutter/material.dart';

class Floor {
  const Floor({
    required this.id,
    required this.callback,
  });
  final int id;
  final Function(int, bool) callback;

  Widget build() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        children: [
          Text('Floor: $id'),
          ElevatedButton(
            child: const Text('^'),
            onPressed: () {
              callback(id, true);
            },
          ),
          const SizedBox(height: 4),
          ElevatedButton(
            child: const Text('v'),
            onPressed: () {
              callback(id, false);
            },
          )
        ],
      ),
    );
  }
}
