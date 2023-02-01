import 'package:elementals/game_logic/game_loop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../game_components/placeholder_card.dart';
import '../../../game_logic/logic.dart';
import '../../../models/enums.dart';
import '../../../providers/gameDataProvider.dart';
import '../../../providers/globalProvider.dart';
import '../../../providers/playerDataProvider.dart';
import 'dynamic_info_channel.dart';
import 'player_turn_action_button.dart';

class PlayerHandArea extends ConsumerWidget {
  const PlayerHandArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: theme.primary, boxShadow: [
        BoxShadow(
            offset: Offset(0, -2),
            color: Colors.grey.shade900,
            blurRadius: 10,
            spreadRadius: 2)
      ]),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: theme.secondary.withOpacity(0.5),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 10),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PlaceholderCard(
                                    isShrunk: false,
                                  ),
                                  PlaceholderCard(
                                    isShrunk: false,
                                  ),
                                  PlaceholderCard(
                                    isShrunk: false,
                                  ),
                                  PlaceholderCard(
                                    isShrunk: false,
                                  ),
                                ],
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: convertDataToCards(
                                    ref.watch(playerProvider).hand,
                                  ))
                            ],
                          ),
                        ]),
                  ),
                ),
                DynamicInfoChannel(),
              ],
            ),
            Expanded(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlayerTurnActionButton(
                      theme: theme,
                      text: 'Skill',
                    ),
                    PlayerTurnActionButton(
                      theme: theme,
                      text: 'Burn',
                    ),
                    GestureDetector(
                      onTap: () {
                        continueGameLoop(ref);
                      },
                      child: PlayerTurnActionButton(
                        theme: theme,
                        text: 'End Turn',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
