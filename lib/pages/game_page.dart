import 'dart:math';

import 'package:elementals/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/game.dart';

double playerCardHeight = 95;
double playerCardWidth = 55;
double opponentCardHeight = 55;
double opponentCardWidth = 32;

double playerIconDisplayHeight = 50;
double playerIconDisplayWidth = 50;

double phoneHeight(var context) => MediaQuery.of(context).size.height;
double phoneWidth(var context) => MediaQuery.of(context).size.width;

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
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: Colors.white, width: 5)),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DummyCard()),
                    ),
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

class OpponentSide extends StatelessWidget {
  const OpponentSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 20,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DummyCard(
                        isPlayer: false,
                      ),
                      DummyCard(
                        isPlayer: false,
                      ),
                      DummyCard(
                        isPlayer: false,
                      ),
                      DummyCard(
                        isPlayer: false,
                      ),
                      DummyCard(
                        isPlayer: false,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DummyCard(
                        isPlayer: false,
                      ),
                      DummyCard(
                        isPlayer: false,
                      ),
                      DummyCard(
                        isPlayer: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayerIconDisplay(
                  icon: Icons.bakery_dining,
                  bgColor: Colors.green.shade700,
                ),
                PlayerIconDisplay(
                  icon: Icons.fire_extinguisher,
                  bgColor: Colors.red.shade700,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PlayerSide extends StatelessWidget {
  const PlayerSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: EdgeInsets.fromLTRB(phoneWidth(context) / 8, 0,
                phoneWidth(context) / 8, phoneHeight(context) / 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [DummyCard(), DummyCard(), DummyCard()],
            ),
          )
        ]),
      ),
    );
  }
}

class PlayerHandArea extends StatelessWidget {
  const PlayerHandArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  color: theme.secondary.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DummyCard(),
                        DummyCard(),
                        DummyCard(),
                        DummyCard(),
                        DummyCard(),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 260,
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
                  text: 'Ability',
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
            width: 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [theme.primary, Colors.black]),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white, width: 2)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Center(
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(fontSize: 16, color: theme.onPrimary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DummyCard extends ConsumerWidget {
  final bool isPlayer;
  const DummyCard({Key? key, this.isPlayer = true}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        height: isPlayer ? playerCardHeight : opponentCardHeight,
        width: isPlayer ? playerCardWidth : opponentCardWidth,
        decoration: BoxDecoration(
            color: isPlayer ? Colors.transparent : Colors.grey.shade900,
            boxShadow: [
              BoxShadow(
                  offset: Offset(-1, 2),
                  blurRadius: 3,
                  spreadRadius: 1,
                  color: Colors.grey.shade800)
            ],
            image: isPlayer
                ? DecorationImage(
                    image: AssetImage(
                        "assets/game_assets/${ref.watch(playerElementProvider).frontImagePath}.png"),
                  )
                : null,
            borderRadius: BorderRadius.circular(2)),
        child: Center(
          child: isPlayer
              ? Text(
                  (Random().nextInt(7) + 1).toString(),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                )
              : null,
        ),
      ),
    );
  }
}

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
      child: Column(
        children: [
          Container(
            height: playerIconDisplayHeight,
            width: playerIconDisplayWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: bgColor,
                border: Border.all(color: Colors.white, width: 2)),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 2)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  points.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
