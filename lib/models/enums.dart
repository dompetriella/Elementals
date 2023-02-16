import '../themes.dart';

enum ElementalType {
  fire(firePrimaryColor, fireSecondaryColor, fireTertriaryColor, 'fire_front'),
  air(airPrimaryColor, airSecondaryColor, airTertriaryColor, 'air_front'),
  water(waterPrimaryColor, waterSecondaryColor, waterTertriaryColor,
      'water_front'),
  earth(earthPrimaryColor, earthSecondaryColor, earthTertriaryColor,
      'earth_front'),
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
