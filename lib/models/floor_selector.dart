import 'package:flutter/material.dart';

class FloorSelector extends StatelessWidget {
  const FloorSelector({
    required this.floorCount,
    required this.onPress,
    required this.currentSelection,
    super.key,
  });
  final int floorCount;
  final List<int> currentSelection;
  final Function(int) onPress;

  Widget floorButton(int index) {
    return ElevatedButton(
      child: Container(
        color: currentSelection.any((e) => e == index) ? Colors.amber : null,
        child: Text('$index'),
      ),
      onPressed: () {
        onPress(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(currentSelection.map((s) => s.toString()).join('-'));
    final buttons = List.generate(floorCount, (index) => floorButton(index));
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: buttons,
      ),
    );
  }
}
