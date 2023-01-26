import 'package:elementals/models/element_card_data.dart';
import 'package:elementals/models/enums.dart';
import 'package:flutter/material.dart';

double playerCardHeight = 95;
double playerCardWidth = 55;
double opponentCardHeight = 55;
double opponentCardWidth = 32;

class ElementCard extends StatelessWidget {
  final bool isPlayer;
  final bool isSelected;
  final bool isFaceUp;
  final ElementCardData elementCardData;
  const ElementCard(
      {super.key,
      required this.elementCardData,
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
      ),
    );
  }
}
