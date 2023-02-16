import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../globals.dart';
import '../../../themes.dart';
import '../main_page.dart';

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
                    HowToSegment(
                      text: 'Basics',
                      body: HowToBody(
                        text: basicsBody,
                        hasPoints: false,
                      ),
                    ),
                    HowToSegment(
                      text: 'Fire',
                      textColor: HexColor(firePrimaryColor),
                      borderColor: HexColor(firePrimaryColor),
                      body: HowToBody(
                        text: fireBody,
                        basePoints: normalPlay,
                        elementalBonus: fireBonus,
                        increaseCards:
                            '${highestCardValue - 2}, ${highestCardValue - 1}, ${highestCardValue - 2}',
                      ),
                    ),
                    HowToSegment(
                      text: 'Air',
                      textColor: HexColor(airPrimaryColor),
                      borderColor: HexColor(airTertriaryColor),
                      body: HowToBody(
                        text: airBody,
                        basePoints: normalPlay,
                        elementalBonus: airBonus,
                        increaseCards:
                            '${lowestCardValue}, ${lowestCardValue + 1}, ${lowestCardValue + 2}',
                      ),
                    ),
                    HowToSegment(
                      text: 'Water',
                      textColor: HexColor(waterPrimaryColor),
                      borderColor: HexColor(waterPrimaryColor),
                      body: HowToBody(
                        text: waterBody,
                        basePoints: normalPlay + 1,
                        elementalBonus: waterBonus,
                      ),
                    ),
                    HowToSegment(
                      text: 'Earth',
                      textColor: HexColor(earthPrimaryColor),
                      borderColor: HexColor(earthPrimaryColor),
                      body: HowToBody(
                        text: earthBody,
                        basePoints: normalPlay,
                        elementalBonus: earthBonus,
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

class HowToSegment extends HookConsumerWidget {
  final String text;
  final Color textColor;
  final Color borderColor;
  final HowToBody body;
  const HowToSegment(
      {Key? key,
      required this.text,
      required this.body,
      this.borderColor = Colors.black,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opened = useState(false);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () => opened.value = !opened.value,
        child: AnimatedContainer(
          width: opened.value ? MediaQuery.of(context).size.width : 100,
          duration: Duration(milliseconds: animationDuration * 2),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: borderColor, width: 2))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              if (opened.value) body
            ],
          ),
        ),
      ),
    );
  }
}

class HowToBody extends StatelessWidget {
  final String text;
  final int basePoints;
  final int elementalBonus;
  final String increaseCards;
  final bool hasPoints;
  const HowToBody(
      {Key? key,
      required this.text,
      this.hasPoints = true,
      this.basePoints = 0,
      this.elementalBonus = 0,
      this.increaseCards = 'N/A'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          if (hasPoints)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Base Points',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '+$basePoints',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Elemental Bonus',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '+$elementalBonus',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Increase Cards',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      increaseCards,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                )
              ],
            )
        ],
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
When you are out of cards you can play, press "End Turn".  Cards not played in your hand will go to your discard pile.

The winner is decided when a player has $winningScore points more than their opponent''';

String fireBody =
    '''Fire complements a very aggressive playstyle, focused on overwhelming the opponent with a perfect deck and high scores.
Fire gets more points for playing higher number value cards, but less points (and even negative) for playing low value cards.
You get the most points for reaching the highest card, $highestCardValue, and an additional bonus if you increased the number value from the previously played card

ABILITY: BURN
When selecting a card, you can BURN it.  Burning a card will permanently remove it from the deck for that game.
You get 1 charge of BURN per turn
''';

String airBody =
    '''Air focuses on de-escalation, both in cards and points.  Air gets more points for playing lower number value cards, and less points for higher value cards.
You get the most points for playing the lowest card, $lowestCardValue, and an additional bonus if you decreased the number value from the previously played card.

ABILITY: GUST
You can press the GUST button to swap a random card in your hand with a random card in your deck
You get 1 charge of GUST per turn;
''';

String waterBody =
    '''Water's strategy is obtaining, low but consistent points, with few large bonuses for playing cards but an increased amount of points for playing any card.
Water does get bonus points for increasing or decreasing the current card's value, however.

ABILITY: CAST
If you have less than $cardsInHand cards in your hand and cards in your discard pile, you can activate the CAST ability.  CAST pulls the last card in your discard pile and puts it in your hand.
You get 1 charge of CAST per turn;
''';

String earthBody =
    '''Earth is slow and steady, waiting for a lucky hand to overwhelm the opponent.  Earth gets a large amount of points for playing the same card value multiple times.

ABILITY: MOLD
When selecting a card, you can MOLD a card, which creates a copy of that card and adds it to the deck
You get 1 charge of MOLD per turn;
''';
