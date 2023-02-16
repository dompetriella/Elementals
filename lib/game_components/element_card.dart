import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:elementals/models/element_card_data.dart';
import 'package:elementals/globals.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../game_logic/logic.dart';
import '../providers/playerDataProvider.dart';

const double cardRaiseHeight = -20;

const double cardDepthX = cardHeightP1 * .035;
const double cardDepthY = cardHeightP1 * .042;
const double cardDepthSpread = cardHeightP1 * .005;

class ElementCard extends HookConsumerWidget {
  final bool isSelectable;
  final bool isFaceUp;
  final bool hasShadow;
  final bool isShrunk;
  final ElementCardData elementCardData;
  const ElementCard(
      {super.key,
      required this.elementCardData,
      this.hasShadow = false,
      this.isFaceUp = true,
      this.isShrunk = false,
      this.isSelectable = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: cardSpacing),
      child: GestureDetector(
        onTap: () {
          selectCardToPlay(elementCardData, ref);
        },
        onDoubleTap: () {
          immediatelyPlayCard(elementCardData, ref);
        },
        child: Transform.translate(
          offset: Offset(
              0,
              ref.watch(playerProvider).selectedCard == elementCardData.id
                  ? cardRaiseHeight
                  : 0),
          child: Container(
            height: isShrunk ? cardHeightP2 : cardHeightP1,
            width:
                (isShrunk ? cardHeightP2 : cardHeightP1) * cardWidthProportion,
            decoration: BoxDecoration(
                color: elementCardData.id == '0'
                    ? Colors.grey.shade800.withOpacity(.5)
                    : Theme.of(context).colorScheme.primary,
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).colorScheme.tertiary,
                      offset: Offset(cardDepthX, cardDepthY),
                      spreadRadius: cardDepthSpread)
                ],
                borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: isFaceUp
                    ? Container(
                        height: cardHeightP1 * .75,
                        width: cardHeightP1 * cardWidthProportion * 0.7,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  inset: true,
                                  offset: Offset(1.5, 2.5),
                                  spreadRadius: 1)
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black,
                                  Theme.of(context).colorScheme.primary
                                ]),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Stack(
                            children: [
                              Text(
                                elementCardData.value.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isShrunk ? 24 : 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Text('')),
          ),
        ),
      ),
    );
  }
}
