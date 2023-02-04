import 'package:flutter/material.dart';
import 'package:lift_viz/models/floor.dart';

import 'lift.dart';

class Building {
  static const List<String> names = ['A', 'B', 'C'];
  static const int levelCount = 10;
  static const int lifCount = 1;
  List<Lift> lifts = [];
  List<Floor> floors = [];

  Building() {
    List<Lift> liftList = [];
    for (int i = 0; i < lifCount; i++) {
      liftList.add(Lift(
          id: i, name: names[i], levelCount: levelCount, callback: moveLift));
    }
    lifts = liftList;
    List<Floor> floorList = [];
    for (int i = 0; i < levelCount; i++) {
      floorList.add(Floor(id: i, callback: callLift));
    }
    floors = floorList;
  }

  void callLift(int level, bool goingUp) {
    debugPrint('Lift required from $level to go ${goingUp ? 'up' : 'down'}');
  }

  void moveLift(int liftId, int level, int targetLevel) {
    debugPrint('Lift ${names[liftId]} from $level to go level $targetLevel');
  }
}
