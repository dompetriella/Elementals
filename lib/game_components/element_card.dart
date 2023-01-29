import 'package:elementals/models/element_card_data.dart';
import 'package:elementals/models/enums.dart';
import 'package:flutter/material.dart';

double proportionPercent = .58;

double playerCardHeight = 90;
double playerCardWidth = playerCardHeight * proportionPercent;
double opponentCardHeight = 65;
double opponentCardWidth = opponentCardHeight * proportionPercent;

class ElementCard extends StatelessWidget {
  final bool isPlayer;
  final bool isSelected;
  final bool isFaceUp;
  final bool isStarter;
  final ElementCardData elementCardData;
  const ElementCard(
      {super.key,
      required this.elementCardData,
      this.isStarter = false,
      this.isPlayer = true,
      this.isFaceUp = true,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        height: isPlayer ? playerCardHeight : opponentCardHeight,
        width: isPlayer ? playerCardWidth : opponentCardWidth,
        color: Colors.black,
        child: Center(
            child: Text(
          elementCardData.value.toString(),
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 32,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
