import 'package:elementals/game_logic/logic.dart';
import 'package:elementals/providers/gameDataProvider.dart';
import 'package:elementals/providers/globalProvider.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:elementals/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../game_components/placeholder_card.dart';
import '../../models/element_card_data.dart';

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
                    child: PlayZone(),
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

class PlayZone extends ConsumerWidget {
  const PlayZone({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.white, width: 5)),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ref.watch(gameDataProvider).playZone.isEmpty
                ? PlaceholderCard()
                : Stack(
                    children: convertDataToCards(
                        ref.watch(gameDataProvider).playZone))));
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
    var element = ref.watch(gameDataProvider).players[1].elementalType;
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
                children:
                    convertDataToCards(ref.watch(playerTwoProvider).hand)),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PlayerCardPile(
                        cardPile: ref.watch(playerProvider).deck,
                      ),
                      Stack(
                        children: [
                          PlayerCardPile(
                            cardPile: ref.watch(playerProvider).discardPile,
                            isDiscard: true,
                          ),
                        ],
                      )
                    ]),
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
                        children: [
                          Stack(
                            children: [
                              Row(
                                children: [
                                  PlaceholderCard(),
                                  PlaceholderCard(),
                                  PlaceholderCard(),
                                  PlaceholderCard(),
                                  PlaceholderCard(),
                                ],
                              ),
                              Row(
                                  children: convertDataToCards(
                                      ref.watch(playerProvider).hand,
                                      hasShadow: true))
                            ],
                          ),
                        ]),
                  ),
                ),
                Container(
                  width: ref.read(cardHeightP1) *
                      ref.read(cardWidthProportion) *
                      5.4,
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
                GestureDetector(
                  onTap: () =>
                      ref.watch(gameDataProvider.notifier).discardPlayZone(ref),
                  child: PlayerTurnActionButton(
                    theme: theme,
                    text: 'End Turn',
                  ),
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

class PlayerIconDisplay extends ConsumerWidget {
  final IconData icon;
  final Color bgColor;
  final int points;
  const PlayerIconDisplay(
      {Key? key, required this.icon, required this.bgColor, this.points = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: ref.read(playerIconDisplaySize),
        width: ref.read(playerIconDisplaySize),
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

class PlayerCardPile extends ConsumerWidget {
  final List<ElementCardData> cardPile;
  final bool isDiscard;
  const PlayerCardPile(
      {super.key, required this.cardPile, this.isDiscard = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          width: ref.read(cardHeightP1) * ref.read(cardWidthProportion),
          child: Center(
            child: Text(
              '${cardPile.length}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
        cardPile.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: PlaceholderCard(),
              )
            : Padding(
                padding: const EdgeInsets.all(4.0),
                child: Stack(
                  children: [
                    Stack(children: convertDataToCards(cardPile)),
                    if (isDiscard)
                      Container(
                        height: ref.read(cardHeightP1),
                        width: ref.read(cardHeightP1) *
                                ref.read(cardWidthProportion) +
                            3,
                        color: Colors.grey.shade600.withOpacity(.35),
                      )
                  ],
                ),
              ),
      ],
    );
  }
}
