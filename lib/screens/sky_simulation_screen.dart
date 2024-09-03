// lib/screens/sky_simulation_screen.dart

import 'package:flutter/material.dart';
import '../models/planet.dart';

class SkySimulationScreen extends StatelessWidget {
  final Planet planet;

  // Constructor to initialize the screen with a specific planet.
  SkySimulationScreen({required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Night Sky from ${planet.name}'),
      ),
      body: Center(
        child: Text(
          'Star Chart for ${planet.name} (coming soon)',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
