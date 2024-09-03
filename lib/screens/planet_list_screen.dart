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

  // This function filters the list of planets based on the user's search query.
  void _filterPlanets(String query) {
    setState(() {
      if (query.isEmpty) {
        // If the search query is empty, show all planets.
        _filteredPlanets = planets;
      } else {
        // Otherwise, filter the planets whose names contain the query string.
        _filteredPlanets = planets
            .where((planet) =>
            planet.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
        ),
        itemCount: _filteredPlanets.length,
        itemBuilder: (context, index) {
          final planet = _filteredPlanets[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the SkySimulationScreen when a planet is tapped.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SkySimulationScreen(planet: planet),
                ),
              );
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
