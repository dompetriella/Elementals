import 'package:elementals/game_logic/animation_logic.dart';
import 'package:elementals/models/enums.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

import '../../../game_logic/game_loop.dart';
import 'player_turn_action_button.dart';

toggleElementalAbility(ElementalType elementalType, WidgetRef ref) {
  ref.read(playerProvider.notifier).state = ref
      .read(playerProvider)
      .copyWith(abilityActive: !ref.read(playerProvider).abilityActive);
}

class ActionButtonArea extends ConsumerWidget {
  const ActionButtonArea({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ColorScheme theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              clearCardTransforms(ref);
              toggleElementalAbility(
                  ref.read(playerProvider).elementalType, ref);
            },
            child: PlayerTurnActionButton(
              theme: theme,
              text: ref
                  .watch(playerProvider)
                  .currentTurnAbility
                  .name
                  .toUpperCase(),
              isAvailable: ref.watch(playerProvider).abilityCharges > 0,
              isActive: ref.watch(playerProvider).abilityActive,
            ),
          ),
          GestureDetector(
            onTap: () {
              continueGameLoop(ref);
            },
            child: PlayerTurnActionButton(
              theme: theme,
              text: 'End Turn',
              isAvailable: true,
            ),
          ),
        ],
      ),
    );
  }
}
