import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../game_components/placeholder_card.dart';
import '../../../game_logic/logic.dart';
import '../../../providers/gameDataProvider.dart';

class PlayZone extends ConsumerWidget {
  const PlayZone({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ref.watch(gameDataProvider).playZone.isEmpty
                ? PlaceholderCard()
                : Stack(
                    children: convertDataToCards(
                        ref.watch(gameDataProvider).playZone))));
  }
}
