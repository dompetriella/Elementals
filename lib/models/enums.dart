import '../themes.dart';

enum ElementalType {
  fire(firePrimaryColor, fireSecondaryColor, fireTertriaryColor, 'fire-icon'),
  air(airPrimaryColor, airSecondaryColor, airTertriaryColor, 'air-icon'),
  water(waterPrimaryColor, waterSecondaryColor, waterTertriaryColor,
      'water-icon'),
  earth(earthPrimaryColor, earthSecondaryColor, earthTertriaryColor,
      'earth-icon'),
  ;

  final String primaryColor;
  final String secondaryColor;
  final String tertiaryColor;
  final String backImagePath;
  const ElementalType(
    this.primaryColor,
    this.secondaryColor,
    this.tertiaryColor,
    this.backImagePath,
  );
}

enum Players { p1, p2 }

enum ValueDifference { increase, decrease, noChange }
