import 'package:flutter/material.dart';
import '../models/planet.dart';

class SkySimulationScreen extends StatefulWidget {
  final Planet planet;

  const SkySimulationScreen({super.key, required this.planet});

  @override
  _SkySimulationScreenState createState() => _SkySimulationScreenState();
}

class _SkySimulationScreenState extends State<SkySimulationScreen> {
  late String skyImagePath;

  @override
  void initState() {
    super.initState();
    skyImagePath = _getSkyImagePath(); // Initialize image path only once
  }

  String _getSkyImagePath() {
    // Return the image path based on the planet name
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

  // Builds the information about the planet in a stylized manner
  Widget _buildPlanetInfo() {
    Map<String, String> planetInfo = {
      'Kepler-22b': '''
        Primary system name: Kepler-224
        Alternative system names: KOI-733, KIC 10271806
        Right ascension: 19 23 44.2257
        Declination: +47 21 27.3023
        Distance [parsec]: 773
        Distance [lightyears]: 2522
        Number of stars in system: 1
        Number of planets in system: 4
      ''',
      'Kepler-69C': '''
        Primary system name: Kepler-694
        Alternative system names: KOI-826, KIC 5272878
        Right ascension: 19 24 35.8800
        Declination: +40 25 13.7930
        Distance [parsec]: 1053±31
        Distance [lightyears]: 3435±101
        Number of stars in system: 1
        Number of planets in system: 1
      ''',
      'Kepler-452b': '''
        Primary system name: Kepler-452
        Alternative system names: KIC 8311864, KOI-7016
        Right ascension: 19 44 00.8860
        Declination: +44 16 39.1704
        Distance [parsec]: 430
        Distance [lightyears]: 1402
        Number of stars in system: 1
        Number of planets in system: 1
      ''',
      'Kepler-62f': '''
        Primary system name: Kepler-62
        Alternative system names: KIC-9002278, KOI-701, KIC 9002278
        Right ascension: 18 52 51.0518
        Declination: +45 20 59.4000
        Distance [parsec]: 368
        Distance [lightyears]: 1200
        Number of stars in system: 1
        Number of planets in system: 5
      ''',
      'Kepler-186f': '''
        Primary system name: Kepler-1868
        Alternative system names: N/A
        Right ascension: 19 33 12
        Declination: +43 33 21
        Distance [parsec]: 274.2±1.0
        Distance [lightyears]: 894±3
        Number of stars in system: 1
        Number of planets in system: 1
      '''
    };

    String info = planetInfo[widget.planet.name] ?? 'Information not available';

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        info,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
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
              _buildMenuItem('explore', Icons.explore, 'Explore Constellations'),
              _buildMenuItem('create', Icons.create, 'Create Constellation'),
              _buildMenuItem('favorite', Icons.favorite, 'Add to Favorites'),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: InteractiveViewer(
              panEnabled: true,
              boundaryMargin: const EdgeInsets.all(20),
              minScale: 0.5,
              maxScale: 4.0,
              child: Image.asset(
                skyImagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: _buildPlanetInfo(),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem(String value, IconData icon, String text) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

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

  void _exploreConstellations() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Explore constellations (feature coming soon)')),
    );
  }

  void _createConstellation() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Create constellation (feature coming soon)')),
    );
  }

  void _addToFavorites() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${widget.planet.name} added to favorites')),
    );
  }
}
