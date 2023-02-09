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
      return "Cast";
    case ElementalType.earth:
      return "Mold";
    default:
      return "Ability";
  }
}

buttonFunctionForElement(ElementalType elementalType, WidgetRef ref) {
  switch (elementalType) {
    case ElementalType.fire:
      ref
          .read(playerProvider.notifier)
          .burnCard(ref, ref.read(playerProvider).selectedCard, Players.p1);
      break;
    case ElementalType.air:
      ref.read(playerProvider.notifier).gustCard(ref, Players.p1);
      break;
    case ElementalType.water:
      ref.read(playerProvider.notifier).castCard(ref, Players.p1);
      break;
    case ElementalType.earth:
      ref.read(playerProvider.notifier).moldCard(
          ref,
          ref.read(playerProvider).selectedCard,
          ref.read(playerProvider),
          Players.p1);
      break;
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
