import 'package:elementals/game_logic/animation_logic.dart';
import 'package:elementals/models/element_card_data.dart';
import 'package:elementals/models/enums.dart';
import 'package:elementals/providers/gameDataProvider.dart';
import 'package:elementals/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../game_logic/logic.dart';
import '../models/player_data.dart';
import '../providers/playerDataProvider.dart';

double cardRaiseHeight = -20;

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
                    : Colors.transparent,
                boxShadow: [
                  hasShadow
                      ? BoxShadow(
                          offset: Offset(-1, 2),
                          blurRadius: 3,
                          spreadRadius: 1,
                          color: Colors.grey.shade800)
                      : BoxShadow(color: Colors.transparent)
                ],
                image: elementCardData.id != '0'
                    ? DecorationImage(
                        image: AssetImage(
                          getCardImage(elementCardData, isFaceUp),
                        ),
                      )
                    : null,
                borderRadius: BorderRadius.circular(2)),
            child: Center(
                child: isFaceUp
                    ? Text(
                        elementCardData.value.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: isShrunk ? 24 : 32,
                            fontWeight: FontWeight.bold),
                      )
                    : Text('')),
          ),
        ),
      ),
    );
  }
}

String getCardImage(ElementCardData elementCardData, bool isFaceUp) {
  switch (isFaceUp) {
    case true:
      return 'assets/game_assets/${elementCardData.elementalType.frontImagePath}.png';
    case false:
      return 'assets/game_assets/${elementCardData.elementalType.backImagePath}.png';
    default:
      return '';
  }
}
