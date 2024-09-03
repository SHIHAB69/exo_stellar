// lib/screens/planet_list_screen.dart

import 'package:flutter/material.dart';
import '../models/planet.dart';
import 'sky_simulation_screen.dart';

class PlanetListScreen extends StatefulWidget {
  @override
  _PlanetListScreenState createState() => _PlanetListScreenState();
}

class _PlanetListScreenState extends State<PlanetListScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Planet> _filteredPlanets = planets;

  // Favorites and user's named constellations
  List<Planet> _favoritePlanets = []; // List to store favorite planets
  List<String> _userConstellations = []; // List to store user's named constellations

  // Function to filter the list of planets based on search query
  void _filterPlanets(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredPlanets = planets;
      } else {
        _filteredPlanets = planets
            .where((planet) =>
            planet.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  // Function to navigate to the favorites screen
  void _showFavorites() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Favorite Planets'),
        content: _favoritePlanets.isEmpty
            ? Text('No favorite planets yet.')
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: _favoritePlanets
              .map((planet) => ListTile(
            title: Text(planet.name),
            leading: Image.asset(
              planet.imagePath,
              width: 40,
              height: 40,
            ),
          ))
              .toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  // Function to navigate to user's constellations screen
  void _showConstellations() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('My Constellations'),
        content: _userConstellations.isEmpty
            ? Text('No constellations named yet.')
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: _userConstellations
              .map((constellation) => ListTile(
            title: Text(constellation),
          ))
              .toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExoStellar - Choose a Planet'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterPlanets,
              decoration: InputDecoration(
                hintText: 'Search for a planet...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'ExoStellar Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorite Planets'),
              onTap: _showFavorites,
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('My Constellations'),
              onTap: _showConstellations,
            ),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
        ),
        itemCount: _filteredPlanets.length,
        itemBuilder: (context, index) {
          final planet = _filteredPlanets[index];
          return GestureDetector(
            onTap: () async {
              // Navigate to the SkySimulationScreen when a planet is tapped.
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SkySimulationScreen(planet: planet),
                ),
              );
              // Check if the planet was added to favorites
              if (result != null && result is Planet) {
                setState(() {
                  _favoritePlanets.add(result); // Add the returned planet to favorites
                });
              }
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(planet.imagePath, height: 100),
                  SizedBox(height: 10),
                  Text(
                    planet.name,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
