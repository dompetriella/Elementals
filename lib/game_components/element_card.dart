import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:elementals/models/element_card_data.dart';
import 'package:elementals/globals.dart';
import 'package:hexcolor/hexcolor.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: cardSpacing),
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
                  : elementCardData.canBeSelected
                      ? -10
                      : 0),
          child: Container(
            height: isShrunk ? cardHeightP2 : cardHeightP1,
            width:
                (isShrunk ? cardHeightP2 : cardHeightP1) * cardWidthProportion,
            decoration: BoxDecoration(
                color: elementCardData.id != '-1'
                    ? HexColor(elementCardData.elementalType.primaryColor)
                    : Colors.transparent,
                boxShadow: [
                  BoxShadow(
                      color: elementCardData.id != '-1'
                          ? HexColor(
                              elementCardData.elementalType.tertiaryColor)
                          : Colors.transparent,
                      offset: const Offset(cardDepthX, cardDepthY),
                      spreadRadius: cardDepthSpread)
                ],
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: isFaceUp
                  ? Container(
                      height:
                          isShrunk ? cardHeightP2 * .75 : cardHeightP1 * .75,
                      width: isShrunk
                          ? cardHeightP2 * cardWidthProportion * 0.7
                          : cardHeightP1 * cardWidthProportion * 0.7,
                      decoration: BoxDecoration(
                          boxShadow: [
                            if (elementCardData.id != '-1')
                              BoxShadow(
                                  color: HexColor(elementCardData
                                      .elementalType.tertiaryColor),
                                  inset: true,
                                  offset: const Offset(1.5, 2.5),
                                  spreadRadius: 1)
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                elementCardData.id != '-1'
                                    ? Colors.black
                                    : Colors.transparent,
                                elementCardData.id != '-1'
                                    ? HexColor(elementCardData
                                        .elementalType.primaryColor)
                                    : Colors.transparent
                              ]),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Stack(
                          children: [
                            if (elementCardData.id != '-1')
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
                  : Container(
                      decoration: elementCardData.id != '-1'
                          ? BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    HexColor(elementCardData
                                        .elementalType.secondaryColor),
                                    HexColor(elementCardData
                                        .elementalType.primaryColor)
                                  ]),
                              borderRadius: BorderRadius.circular(5))
                          : null,
                      child: elementCardData.id != '-1'
                          ? Center(
                              child: Image.asset(
                                  'assets/game_assets/${elementCardData.elementalType.backImagePath}.png',
                                  width:
                                      (cardHeightP1 * cardWidthProportion) * .4,
                                  height: (cardHeightP1 * cardWidthProportion) *
                                      .4),
                            )
                          : null,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
