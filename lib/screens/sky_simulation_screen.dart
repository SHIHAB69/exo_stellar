// lib/screens/sky_simulation_screen.dart

import 'package:flutter/material.dart';
import '../models/planet.dart';

class SkySimulationScreen extends StatefulWidget {
  final Planet planet;

  // Constructor to initialize the screen with a specific planet.
  SkySimulationScreen({required this.planet});

  @override
  _SkySimulationScreenState createState() => _SkySimulationScreenState();
}

class _SkySimulationScreenState extends State<SkySimulationScreen> {
  // Method to get the corresponding sky chart image path based on the planet name.
  String _getSkyImagePath() {
    switch (widget.planet.name) {
      case 'Kepler-22b':
        return 'assets/skychartasset/kepler1.jpeg';
      case 'Kepler-69C':
        return 'assets/skychartasset/kepler2.jpeg';
      case 'Kepler-452b':
        return 'assets/skychartasset/kepler3.jpeg';
      case 'Kepler-62f':
        return 'assets/skychartasset/kepler4.jpeg';
      case 'Kepler-186f':
        return 'assets/skychartasset/kepler5.jpeg';
      default:
        return 'assets/skychartasset/kepler1.jpeg'; // Fallback image
    }
  }

  // Handle menu actions
  void _handleMenuAction(String action) {
    switch (action) {
      case 'explore':
        _exploreConstellations();
        break;
      case 'create':
        _createConstellation();
        break;
      case 'favorite':
        _addToFavorites();
        break;
    }
  }

  // Method to explore existing constellations
  void _exploreConstellations() {
    // Implement constellation exploration logic here
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Explore constellations (feature coming soon)'),
    ));
  }

  // Method to create and name a new constellation
  void _createConstellation() {
    // Implement constellation creation logic here
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Create constellation (feature coming soon)'),
    ));
  }

  // Method to add a constellation to favorites
  void _addToFavorites() {
    // Show confirmation and return the planet as a favorite
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${widget.planet.name} added to favorites'),
    ));
    // Return to the previous screen with a signal to add to favorites
    Navigator.pop(context, widget.planet); // Return the planet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Night Sky from ${widget.planet.name}'),
        actions: [
          PopupMenuButton<String>(
            onSelected: _handleMenuAction,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'explore',
                child: Row(
                  children: [
                    Icon(Icons.explore),
                    SizedBox(width: 8),
                    Text('Explore Constellations'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'create',
                child: Row(
                  children: [
                    Icon(Icons.create),
                    SizedBox(width: 8),
                    Text('Create Constellation'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'favorite',
                child: Row(
                  children: [
                    Icon(Icons.favorite),
                    SizedBox(width: 8),
                    Text('Add to Favorites'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true, // Enables panning
          boundaryMargin: EdgeInsets.all(20), // Allow panning beyond the screen edges
          minScale: 0.5, // Minimum zoom scale
          maxScale: 4.0, // Maximum zoom scale
          child: Image.asset(
            _getSkyImagePath(), // Display the corresponding sky chart image
            fit: BoxFit.cover, // Make sure the image fits the screen
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
