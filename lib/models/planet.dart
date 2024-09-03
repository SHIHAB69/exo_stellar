// lib/models/planet.dart

class Planet {
  final String name;
  final String imagePath;
  final Map<String, String> info; // Additional info about the planet

  Planet({required this.name, required this.imagePath, required this.info});
}

final List<Planet> planets = [
  Planet(
    name: 'Kepler-22b',
    imagePath: 'assets/kepler-22b.png',
    info: {
      'Primary system name': 'Kepler-224',
      'Alternative system names': 'KOI-733, KIC 10271806',
      'Right ascension': '19 23 44.2257',
      'Declination': '+47 21 27.3023',
      'Distance [parsec]': '773',
      'Distance [lightyears]': '2522',
      'Number of stars in system': '1',
      'Number of planets in system': '4',
    },
  ),
  Planet(
    name: 'Kepler-69C',
    imagePath: 'assets/kepler-69c.png',
    info: {
      'Primary system name': 'Kepler-694',
      'Alternative system names': 'KOI-826, KIC 5272878',
      'Right ascension': '19 24 35.8800',
      'Declination': '+40 25 13.7930',
      'Distance [parsec]': '1053±31',
      'Distance [lightyears]': '3435±101',
      'Number of stars in system': '1',
      'Number of planets in system': '1',
    },
  ),
  Planet(
    name: 'Kepler-452b',
    imagePath: 'assets/kepler-452b.png',
    info: {
      'Primary system name': 'Kepler-452',
      'Alternative system names': 'KIC 8311864, KOI-7016',
      'Right ascension': '19 44 00.8860',
      'Declination': '+44 16 39.1704',
      'Distance [parsec]': '430',
      'Distance [lightyears]': '1402',
      'Number of stars in system': '1',
      'Number of planets in system': '1',
    },
  ),
  Planet(
    name: 'Kepler-62f',
    imagePath: 'assets/kepler-62f.png',
    info: {
      'Primary system name': 'Kepler-62',
      'Alternative system names': 'KIC-9002278, KOI-701, KIC 9002278',
      'Right ascension': '18 52 51.0518',
      'Declination': '+45 20 59.4000',
      'Distance [parsec]': '368',
      'Distance [lightyears]': '1200',
      'Number of stars in system': '1',
      'Number of planets in system': '5',
    },
  ),
  Planet(
    name: 'Kepler-186f',
    imagePath: 'assets/kepler-186f.png',
    info: {
      'Primary system name': 'Kepler-1868',
      'Alternative system names': 'N/A',
      'Right ascension': '19 33 12',
      'Declination': '+43 33 21',
      'Distance [parsec]': '274.2±1.0',
      'Distance [lightyears]': '894±3',
      'Number of stars in system': '1',
      'Number of planets in system': '1',
    },
  ),
];
