import 'package:elementals/models/enums.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:elementals/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<ThemeData>((ref) {
  return fireTheme;
});

updateThemeToElement(WidgetRef ref) {
  switch (ref.read(playerProvider).elementalType) {
    case ElementalType.fire:
      ref.read(themeProvider.notifier).state = fireTheme;
      break;
    case ElementalType.air:
      ref.read(themeProvider.notifier).state = airTheme;
      break;
    case ElementalType.water:
      ref.read(themeProvider.notifier).state = waterTheme;
      break;
    case ElementalType.earth:
      ref.read(themeProvider.notifier).state = earthTheme;
      break;
    default:
  }
}
