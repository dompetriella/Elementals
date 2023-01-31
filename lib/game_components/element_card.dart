import 'package:elementals/game_logic/animation_logic.dart';
import 'package:elementals/models/element_card_data.dart';
import 'package:elementals/models/enums.dart';
import 'package:elementals/providers/globalProvider.dart';
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
      padding: EdgeInsets.symmetric(horizontal: ref.read(cardSpacing)),
      child: GestureDetector(
        onTap: () {
          if (elementCardData.canBeSelected &&
              elementCardData.ownerId == ref.watch(playerProvider).id)
          // if the card is selected, play it
          if (ref.watch(playerProvider).selectedCard == elementCardData.id) {
            ref
                .watch(playerProvider.notifier)
                .playCard(elementCardData.id, ref, Players.p1);
            clearCardTransforms(ref);
            // select the card
          } else {
            ref.watch(playerProvider.notifier).state = ref
                .watch(playerProvider.notifier)
                .state
                .copyWith(selectedCard: elementCardData.id);
            notifyDynamicInfo(
                ref, 'Card Id: ${ref.watch(playerProvider).selectedCard}');
          }
        },
        onDoubleTap: () {
          if (elementCardData.canBeSelected &&
              elementCardData.ownerId == ref.watch(playerProvider).id)
            // play the card
            ref
                .watch(playerProvider.notifier)
                .playCard(elementCardData.id, ref, Players.p1);
          clearCardTransforms(ref);
        },
        child: Transform.translate(
          offset: Offset(
              0,
              ref.watch(playerProvider).selectedCard == elementCardData.id
                  ? cardRaiseHeight
                  : 0),
          child: Container(
            height: isShrunk ? ref.read(cardHeightP2) : ref.read(cardHeightP1),
            width:
                (isShrunk ? ref.read(cardHeightP2) : ref.read(cardHeightP1)) *
                    ref.read(cardWidthProportion),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey, width: 0.5),
                boxShadow: [
                  hasShadow
                      ? BoxShadow(
                          offset: Offset(-1, 2),
                          blurRadius: 3,
                          spreadRadius: 1,
                          color: Colors.grey.shade800)
                      : BoxShadow(color: Colors.transparent)
                ],
                image: DecorationImage(
                  image: AssetImage(
                    getCardImage(elementCardData, isFaceUp),
                  ),
                ),
                borderRadius: BorderRadius.circular(2)),
            child: Center(
                child: isFaceUp
                    ? Text(
                        elementCardData.value.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
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
      return 'assets/game_assets/${elementCardData.elementalType.frontImagePath}.png';
  }
}
