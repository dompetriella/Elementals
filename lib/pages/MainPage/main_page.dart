import 'dart:math';
import 'package:elementals/game_logic/startup.dart';
import 'package:elementals/globals.dart';
import 'package:elementals/providers/gameDataProvider.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:elementals/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/enums.dart';

var animationDuration = 400;

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: animationDuration),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                colors: [Theme.of(context).colorScheme.primary, Colors.black])),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 150, 32, 32.0),
                  child: Text(
                    "Elementals",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200.withOpacity(.25)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32.0, horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Choose an Element",
                          style: TextStyle(fontSize: 24, color: Colors.white70),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            direction: Axis.horizontal,
                            children: [
                              ElementSelectButton(
                                elementalType: ElementalType.fire,
                              ),
                              ElementSelectButton(
                                elementalType: ElementalType.air,
                              ),
                              ElementSelectButton(
                                elementalType: ElementalType.water,
                              ),
                              ElementSelectButton(
                                elementalType: ElementalType.earth,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.go('/game_page');
                            setInitalGameProperties(ref);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: animationDuration),
                            width: 180,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(-5, 5),
                                      color:
                                          Theme.of(context).colorScheme.primary)
                                ],
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: Center(
                                child: Text(
                              'Play',
                              style: TextStyle(fontSize: 32),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: HowToPlay(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HowToPlay extends HookConsumerWidget {
  const HowToPlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opened = useState(false);
    return GestureDetector(
      onTap: () => opened.value = !opened.value,
      child: AnimatedContainer(
        duration: Duration(milliseconds: animationDuration),
        curve: Curves.easeInOut,
        width: opened.value ? MediaQuery.of(context).size.width : 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(offset: Offset(-5, 5), color: Colors.grey)],
            border: Border.all(color: Colors.black, width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: opened.value
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: opened.value ? 8.0 : 0.0),
                child: Text(
                  'How To Play',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
              if (opened.value)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HowToTitle(
                      text: 'Basics',
                    ),
                    HowToBody(
                      text: basicsBody,
                    ),
                    HowToTitle(text: 'Fire'),
                    HowToBody(text: fireBody)
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

class HowToBody extends StatelessWidget {
  final String text;
  const HowToBody({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }
}

class HowToTitle extends StatelessWidget {
  final String text;
  const HowToTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ElementSelectButton extends ConsumerWidget {
  final ElementalType elementalType;
  const ElementSelectButton({super.key, required this.elementalType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chosenElement = ref.watch(playerProvider).elementalType;
    return GestureDetector(
      onTap: () {
        ref.read(playerProvider.notifier).changePlayerElement(elementalType);
        updateThemeToElement(ref);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: animationDuration),
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: chosenElement == elementalType
                    ? [Theme.of(context).colorScheme.primary, Colors.black]
                    : [Colors.transparent, Colors.transparent]),
            boxShadow: [
              chosenElement != elementalType
                  ? BoxShadow(offset: Offset(-5, 5), color: Colors.grey)
                  : BoxShadow()
            ],
            border: Border.all(color: Colors.black, width: 2)),
        child: Center(
            child: Text(
          elementalType.name.toUpperCase(),
          style: TextStyle(
              fontSize: 24,
              color:
                  chosenElement == elementalType ? Colors.white : Colors.black),
        )),
      ),
    );
  }
}

String basicsBody =
    '''Play as many cards as you can in your turn.  You can play cards that are:
-same number value as the card in the middle
-one number higher
-one number lower

Selecting a card gives you information on that card and its value- clicking a selected card plays it.
(You can play a card immediately by double-clicking it)

Playing a card will net you points- how many points depends on what card you played and what element you chose.
When you are out of cards you can play, press "End Turn".

The winner is decided when a player has $winningScore points more than their opponent''';

String fireBody =
    '''Fire complements a very aggressive playstyle, focused on overwhelming the opponent with a perfect deck and high scores.
Fire gets more points for playing higher value cards, but less points (and even negative) for playing low value points.
You get the most points for reaching the highest card, $highestCardValue, and an additional bonus if you increased the number value from the previously played card

ABILITY: BURN
When selecting a card, you can BURN it.  Burning a card will permanently remove it from the deck for that game.
You get 1 charge of BURN per turn
''';
