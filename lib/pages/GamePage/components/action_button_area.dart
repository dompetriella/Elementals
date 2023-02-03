import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

import '../../../game_logic/game_loop.dart';
import 'player_turn_action_button.dart';

class ActionButtonArea extends ConsumerWidget {
  const ActionButtonArea({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ColorScheme theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PlayerTurnActionButton(
              theme: theme,
              text: 'Skill',
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
    );
  }
}
