import 'package:elementals/models/element_card_data.dart';
import 'package:elementals/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/playerDataProvider.dart';

double proportionPercent = .58;

double playerCardHeight = 90;
double playerCardWidth = playerCardHeight * proportionPercent;
double opponentCardHeight = 65;
double opponentCardWidth = opponentCardHeight * proportionPercent;

class ElementCard extends HookConsumerWidget {
  final bool isSelected;
  final bool isFaceUp;
  final ElementCardData elementCardData;
  const ElementCard(
      {super.key,
      required this.elementCardData,
      this.isFaceUp = true,
      this.isSelected = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedState = useState(isSelected);
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
      child: GestureDetector(
        onTap: () => selectedState.value = !selectedState.value,
        child: Container(
          height: playerCardHeight,
          width: playerCardWidth,
          decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                    offset: Offset(-1, 2),
                    blurRadius: 3,
                    spreadRadius: 1,
                    color: Colors.grey.shade800)
              ],
              image: DecorationImage(
                image: AssetImage(
                    "assets/game_assets/${ref.watch(playerProvider).elementalType.frontImagePath}.png"),
              ),
              borderRadius: BorderRadius.circular(2)),
          child: Center(
              child: Text(
            elementCardData.value.toString(),
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 32,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
