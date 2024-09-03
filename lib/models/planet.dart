// lib/models/planet.dart

// The Planet class represents an exoplanet with a name and an image path.
class Planet {
  final String name;       // Name of the planet
  final String imagePath;  // Path to the image of the planet

  // Constructor to initialize a Planet with a name and image path.
  Planet({required this.name, required this.imagePath});
}

// A list of planets available in the app.
final List<Planet> planets = [
  Planet(name: 'Kepler-22b', imagePath: 'assets/kepler-22b.png'),
  Planet(name: 'Kepler-69C', imagePath: 'assets/kepler-69c.png'),
  Planet(name: 'Kepler-452b', imagePath: 'assets/kepler-452b.png'),
  Planet(name: 'Kepler-62f', imagePath: 'assets/kepler-62f.png'),
  Planet(name: 'Kepler-186f', imagePath: 'assets/kepler-186f.png'),
];
