import 'package:flutter/material.dart';
import 'package:lift_viz/models/floor.dart';

import 'lift.dart';

class Building {
  final Function refresh;
  static const List<String> names = ['A', 'B', 'C'];
  static const int floorCount = 10;
  static const int lifCount = 1;
  List<Lift> lifts = [];
  List<Floor> floors = [];

  Building({required this.refresh}) {
    List<Lift> liftList = [];
    for (int i = 0; i < lifCount; i++) {
      liftList.add(
        Lift(
          id: i,
          name: names[i],
          floorCount: floorCount,
          sendLift: moveLift,
          refresh: refresh,
        ),
      );
    }
    lifts = liftList;
    List<Floor> floorList = [];
    for (int i = 0; i < floorCount; i++) {
      floorList.add(Floor(id: i, callback: callLift));
    }
    floors = floorList;
  }

  void callLift(int floor, bool goingUp) {
    debugPrint('Lift required from $floor to go ${goingUp ? 'up' : 'down'}');
  }

  void moveLift(int liftId, int floor, int targetfloor) {
    debugPrint('Lift ${names[liftId]} from $floor to go floor $targetfloor');
  }
}
