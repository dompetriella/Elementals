import 'package:elementals/models/enums.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:elementals/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<ThemeData>((ref) {
  return fireTheme;
});

updateThemeToElement(WidgetRef ref) {
  switch (ref.watch(playerProvider).elementalType) {
    case ElementalType.fire:
      ref.watch(themeProvider.notifier).state = fireTheme;
      break;
    case ElementalType.air:
      ref.watch(themeProvider.notifier).state = airTheme;
      break;
    case ElementalType.water:
      ref.watch(themeProvider.notifier).state = waterTheme;
      break;
    case ElementalType.earth:
      ref.watch(themeProvider.notifier).state = earthTheme;
      break;
    default:
  }
}