import 'package:elementals/globals.dart';
import 'package:elementals/providers/gameDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'components/background_areas.dart';
import 'components/opponent_side.dart';
import 'components/play_zone.dart';
import 'components/player_hand_area.dart';
import 'components/player_side.dart';
import 'components/settings_button.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  flex: gameField,
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              OpponentSideBackground(),
                              PlayerBackground(),
                            ],
                          ),
                          Column(
                            children: [
                              OpponentSide(),
                              PlayerSide(),
                            ],
                          ),
                        ],
                      ),
                      SettingsButton(),
                      Center(
                        child: PlayZone(),
                      ),
                    ],
                  ),
                ),
                Flexible(flex: playerField, child: PlayerHandArea())
              ],
            ),
            if (ref.watch(gameDataProvider).overallScore >= winningScore)
              WinModal()
          ],
        ),
      ),
    );
  }
}

class WinModal extends ConsumerWidget {
  const WinModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          color: Colors.grey.shade800.withOpacity(0.50),
        ),
        Center(
          child: Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.grey.shade400.withOpacity(0.70),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${ref.watch(gameDataProvider).currentWinner.name} Wins!',
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: (() => context.go('/')),
                  child: Container(
                    width: 180,
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-5, 5),
                              color: Theme.of(context).colorScheme.primary)
                        ],
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Center(
                        child: Text(
                      'Return to Main Screen',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
