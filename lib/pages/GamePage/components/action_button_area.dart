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

buttonFunctionForElement(ElementalType elementalType, WidgetRef ref) {
  switch (elementalType) {
    case ElementalType.fire:
    case ElementalType.air:
    case ElementalType.water:
    case ElementalType.earth:
  }
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
              buttonFunctionForElement(
                  ref.read(playerProvider).elementalType, ref);
            },
            child: PlayerTurnActionButton(
              theme: theme,
              text: getButtonName(ref.watch(playerProvider).elementalType),
              isActive: ref.watch(playerProvider).abilityCharges > 0,
            ),
          ),
          GestureDetector(
            onTap: () {
              continueGameLoop(ref);
            },
            child: PlayerTurnActionButton(
              theme: theme,
              text: 'End Turn',
              isActive: true,
            ),
          ),
        ],
      ),
    );
  }
}
