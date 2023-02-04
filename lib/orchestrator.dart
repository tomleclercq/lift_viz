import 'package:flutter/material.dart';
import 'package:lift_viz/models/building.dart';

class Orchestrator extends StatefulWidget {
  const Orchestrator({super.key});

  @override
  State<Orchestrator> createState() => _OrchestratorState();
}

class _OrchestratorState extends State<Orchestrator> {
  Building building = Building();
  @override
  void initState() {
    super.initState();
    debugPrint('${building.lifts.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Lifts'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...building.floors.map((f) => f.build()).toList(),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...building.lifts.map((l) => l.build()).toList(),
            ],
          ),
        ],
      ),
    );
  }
}
