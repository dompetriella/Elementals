enum ElementalType {
  fire('fire_back', 'fire_front'),
  air('air_back', 'air_front'),
  water('water_back', 'water_front'),
  earth('earth_back', 'earth_front');

  final String backImagePath;
  final String frontImagePath;
  const ElementalType(this.backImagePath, this.frontImagePath);
}

// enum ElementalType {fire, air, water, earth};
