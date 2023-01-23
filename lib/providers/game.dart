import 'package:elementals/models/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerElementProvider = StateProvider<ElementalType>((ref) {
  return ElementalType.fire;
});
