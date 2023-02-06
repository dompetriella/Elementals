import 'package:elementals/providers/playerDataProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logic.dart';

clearCardTransforms(WidgetRef ref) {
  ref.read(playerProvider.notifier).state =
      ref.watch(playerProvider.notifier).state.copyWith(selectedCard: '');
}
