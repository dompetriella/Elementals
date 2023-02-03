enum ElementalType {
  fire('#A31C1C', '#C97221', 'fire_back', 'fire_front'),
  air('#CAC858', '#FEFDBE', 'air_back', 'air_front'),
  water('#47559C', '#6FC7DA', 'water_back', 'water_front'),
  earth('#1F4921', '#A2D6A4', 'earth_back', 'earth_front'),
  ;

  final String primaryColor;
  final String secondaryColor;
  final String backImagePath;
  final String frontImagePath;
  const ElementalType(this.primaryColor, this.secondaryColor,
      this.backImagePath, this.frontImagePath);
}

enum Players { p1, p2 }

enum ValueDifference { increase, decrease, noChange }
