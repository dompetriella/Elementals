import 'package:elementals/models/enums.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

import '../../../game_logic/game_loop.dart';
import 'player_turn_action_button.dart';

String getButtonName(ElementalType elementalType) {
  switch (elementalType) {
    case ElementalType.fire:
      return "Burn";
    case ElementalType.air:
      return "Gust";
    case ElementalType.water:
      return "Tide";
    case ElementalType.earth:
      return "Mold";
    default:
      return "Ability";
  }
}

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
              toggleElementalAbility(
                  ref.read(playerProvider).elementalType, ref);
            },
            child: PlayerTurnActionButton(
              theme: theme,
              text: getButtonName(ref.watch(playerProvider).elementalType),
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
