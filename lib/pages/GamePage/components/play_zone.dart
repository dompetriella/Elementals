import 'package:elementals/globals.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../game_logic/logic.dart';
import '../../../providers/gameDataProvider.dart';

class PlayZone extends ConsumerWidget {
  const PlayZone({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ref.watch(gameDataProvider).currentWinner.id != '0'
                ? HexColor(ref
                    .watch(gameDataProvider)
                    .currentWinner
                    .elementalType
                    .secondaryColor)
                : Colors.transparent,
            boxShadow: [
              if (ref.watch(gameDataProvider).currentWinner.id != '0')
                BoxShadow(
                    color: HexColor(ref
                        .watch(gameDataProvider)
                        .currentWinner
                        .elementalType
                        .tertiaryColor),
                    spreadRadius: 2 *
                        (ref.watch(gameDataProvider).overallScore.toDouble() /
                            winningScore),
                    offset: ref.watch(gameDataProvider).currentWinner.id != '0'
                        ? Offset(2, 4)
                        : Offset(0, 0))
            ]),
        child: AnimatedPadding(
            duration: Duration(milliseconds: 800),
            padding: ref.watch(gameDataProvider).currentWinner.id == '0'
                ? EdgeInsets.all(0)
                : EdgeInsets.all(
                    8 +
                        10 *
                            (ref
                                    .watch(gameDataProvider)
                                    .overallScore
                                    .toDouble() /
                                winningScore),
                  ),
            child: ref.watch(gameDataProvider).playZone.isNotEmpty
                ? Stack(
                    children: convertDataToCards(
                        ref.watch(gameDataProvider).playZone))
                : Container(
                    height: cardHeightP1,
                    width: cardHeightP1 * cardWidthProportion,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            inset: true,
                            offset: const Offset(1.5, 2.5),
                            spreadRadius: 1)
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.grey.shade900, Colors.grey.shade800]),
                    ),
                  )));
  }
}
