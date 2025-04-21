import 'package:flutter/material.dart';

class StepCounterPage extends StatelessWidget {
  const StepCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Step Counter')),
      body: const Center(child: Text('Step Counter Feature Page')),
    );
  }
}
