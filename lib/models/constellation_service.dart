// lib/models/constellation_service.dart

import 'constellation.dart';

class ConstellationService {
  // Singleton pattern to ensure a single instance of ConstellationService
  static final ConstellationService _instance = ConstellationService._internal();

  // Factory constructor to return the singleton instance
  factory ConstellationService() {
    return _instance;
  }

  // Private constructor
  ConstellationService._internal();

  // List to store the user's named constellations
  final List<Constellation> _constellations = [];

  // Method to add a new constellation
  void addConstellation(Constellation constellation) {
    _constellations.add(constellation);
  }

  // Method to retrieve all constellations
  List<Constellation> get constellations => List.unmodifiable(_constellations);
}
