import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardsInHand = Provider<int>((ref) {
  return 5;
});

final cardWidthProportion = Provider<double>((ref) {
  return .58;
});

final cardHeightP1 = Provider<double>((ref) {
  return 90;
});

final cardHeightP2 = Provider<double>((ref) {
  return 60;
});

final playerIconDisplaySize = Provider<double>((ref) {
  return 60;
});
