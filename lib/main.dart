// lib/main.dart

import 'package:flutter/material.dart';
import 'screens/planet_list_screen.dart';

void main() {
  runApp(ExoStellarApp());
}

// The main app widget that sets up the theme and initial screen.
class ExoStellarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExoStellar',
      theme: ThemeData.dark(),
      home: PlanetListScreen(),
    );
  }
}
