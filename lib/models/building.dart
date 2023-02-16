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

  Widget build() {
    return Container(
      color: Colors.amber,
      child: Stack(
        children: [
          Column(
            children: [
              ...floors.reversed
                  .map(
                    (f) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50,
                        height: 24,
                        color: Colors.red,
                        child: SizedBox.expand(
                          child:
                              Center(child: Text(floors.indexOf(f).toString())),
                        ),
                      ),
                    ),
                  )
                  .toList()
            ],
          ),
          Positioned(
            left: 8,
            bottom: 8,
            child: Container(
              color: Colors.blue,
              height: 50,
              width: 50,
            ),
          )
        ],
      ),
    );
  }
}
