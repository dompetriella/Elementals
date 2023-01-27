import 'dart:math';
import 'package:elementals/game_components/element_card.dart';
import 'package:elementals/models/element_card_data.dart';
import 'package:elementals/models/enums.dart';
import 'package:elementals/providers/gameDataProvider.dart';
import 'package:elementals/providers/playerProvider.dart';
import 'package:elementals/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

import '../game_components/placeholder_card.dart';
import '../providers/gameProvider.dart';

double phoneHeight(var context) => MediaQuery.of(context).size.height;
double phoneWidth(var context) => MediaQuery.of(context).size.width;

double playerCardHeight = 90;
double playerCardWidth = playerCardHeight * .58;
double opponentCardHeight = 65;
double opponentCardWidth = opponentCardHeight * .58;

double playerIconDisplayHeight = 60;
double playerIconDisplayWidth = 60;

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Column(
          children: [
            Flexible(
              flex: 5,
              child: Stack(
                children: [
                  Column(
                    children: [
                      OpponentSide(),
                      PlayerSide(),
                    ],
                  ),
                  SettingsButton(),
                  Center(
                    child: PlayZoneCard(),
                  )
                ],
              ),
            ),
            Flexible(flex: 3, child: PlayerHandArea())
          ],
        ),
      ),
    );
  }
}

// I can give this local state with hooks to swap placeholder
class PlayZoneCard extends ConsumerWidget {
  const PlayZoneCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var game = ref.watch(gameProvider.notifier).state;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: Colors.white, width: 5)),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: game.playZone.length > 0
              ? Stack(
                  children: game.playZone,
                )
              : PlaceholderCard()),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: -5,
      child: Center(
        child: GestureDetector(
          onTap: () => context.go('/'),
          child: Container(
            height: 70,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white, width: 2),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Theme.of(context).colorScheme.primary
                    ])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
            ),
          ),
        ),
      ),
    );
  }
}

class OpponentSide extends ConsumerWidget {
  const OpponentSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var element = ref.watch(opponentProvider).elementalType;
    return Flexible(
      flex: 20,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              HexColor(element.primaryColor),
              HexColor(element.secondaryColor)
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayerIconDisplay(
                  icon: Icons.bakery_dining,
                  bgColor: ref.watch(themeProvider).colorScheme.primary,
                ),
                PlayerIconDisplay(
                  icon: Icons.fire_extinguisher,
                  bgColor: HexColor(element.primaryColor),
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ref.watch(opponentProvider).hand),
          ],
        ),
      ),
    );
  }
}

class PlayerSide extends ConsumerWidget {
  const PlayerSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var player = ref.watch(playerProvider.notifier).state;
    return Flexible(
      flex: 20,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ]),
          border: Border(top: BorderSide(color: Colors.white, width: 5)),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 48, right: 24),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [PlayerDiscardPile()]),
              )
            ]),
      ),
    );
  }
}

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                      children: ref.watch(playerProvider).hand.length < 1
                          ? [
                              PlaceholderCard(),
                              PlaceholderCard(),
                              PlaceholderCard(),
                              PlaceholderCard(),
                              PlaceholderCard(),
                            ]
                          : ref.watch(playerProvider).hand,
                    ),
                  ),
                ),
                Container(
                  width: playerCardWidth * 5.5,
                  height: 80,
                  color: Colors.grey.shade900,
                ),
              ],
            ),
            Row(
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
                PlayerTurnActionButton(
                  theme: theme,
                  text: 'End Turn',
                ),
              ],
            ),
          ]),
    );
  }
}

class PlayerTurnActionButton extends StatelessWidget {
  final String text;
  const PlayerTurnActionButton(
      {Key? key, required this.theme, required this.text})
      : super(key: key);

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [theme.primary, Colors.black]),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 3),
                      color: Colors.grey.shade800)
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Center(
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class DummyCard extends ConsumerWidget {
//   final bool isPlayer;
//   const DummyCard({Key? key, this.isPlayer = true}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 2.0),
//       child: Container(
//         height: isPlayer ? playerCardHeight : opponentCardHeight,
//         width: isPlayer ? playerCardWidth : opponentCardWidth,
//         decoration: BoxDecoration(
//             color: isPlayer ? Colors.transparent : Colors.grey.shade900,
//             boxShadow: [
//               BoxShadow(
//                   offset: Offset(-1, 2),
//                   blurRadius: 3,
//                   spreadRadius: 1,
//                   color: Colors.grey.shade800)
//             ],
//             image: isPlayer
//                 ? DecorationImage(
//                     image: AssetImage(
//                         "assets/game_assets/${ref.watch(playerProvider).elementalType.frontImagePath}.png"),
//                   )
//                 : DecorationImage(
//                     image: AssetImage(
//                         "assets/game_assets/${ref.watch(opponentProvider).elementalType.backImagePath}.png"),
//                   ),
//             borderRadius: BorderRadius.circular(2)),
//         child: Center(
//           child: isPlayer
//               ? Text(
//                   (Random().nextInt(7) + 1).toString(),
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold),
//                 )
//               : null,
//         ),
//       ),
//     );
//   }
// }

class PlayerIconDisplay extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final int points;
  const PlayerIconDisplay(
      {Key? key, required this.icon, required this.bgColor, this.points = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: playerIconDisplayHeight,
        width: playerIconDisplayWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade900,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2))
            ],
            color: bgColor,
            border: Border.all(color: Colors.white, width: 2)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

class PlayerDiscardPile extends ConsumerWidget {
  const PlayerDiscardPile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var player = ref.watch(playerProvider.notifier).state;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: playerCardWidth,
            child: Center(
              child: Text(
                '0 / 20',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
        ),
        player.discardPile.length < 1
            ? PlaceholderCard()
            : Stack(children: player.discardPile)
      ],
    );
  }
}
