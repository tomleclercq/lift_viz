import 'package:flutter/material.dart';

class Floor {
  Floor({
    required this.id,
    required this.callback,
  });
  final int id;
  final Function(int, bool) callback;
  List<int> currentLifts = [];

  void liftArrived(int liftId) {
    currentLifts.add(liftId);
  }

  void liftLeft(int liftId) {
    currentLifts.remove(liftId);
  }

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
