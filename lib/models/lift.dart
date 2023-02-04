import 'package:flutter/material.dart';
import 'package:lift_viz/models/floor_selector.dart';

class Lift {
  Lift(
      {required this.id,
      required this.name,
      required this.floorCount,
      required this.sendLift,
      required this.refresh});
  final int id;
  final String name;
  final int floorCount;
  final List<int> currentSelection = [];
  final Function(int, int, int) sendLift;
  final Function refresh;

  int floor = 0;
  int targetfloor = 0;
  bool goingUp = false;
  double height = 0;

  void onPress(int targetFloor) {
    if (currentSelection.any((s) => s == targetFloor)) {
      currentSelection.remove(targetFloor);
    } else {
      currentSelection.add(targetFloor);
      sendLift(id, floor, targetFloor);
    }
    refresh();
  }

  Widget build() {
    debugPrint(
        'lift $name: ${currentSelection.map((s) => s.toString()).join('-')}');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Lift: $name'),
          FloorSelector(
              floorCount: floorCount,
              currentSelection: currentSelection,
              onPress: onPress)
        ],
      ),
    );
  }
}
