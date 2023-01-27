import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

double phoneHeight(var context) => MediaQuery.of(context).size.height;
double phoneWidth(var context) => MediaQuery.of(context).size.width;

double playerCardHeight = 90;
double playerCardWidth = playerCardHeight * .58;
double opponentCardHeight = 65;
double opponentCardWidth = opponentCardHeight * .58;

double playerIconDisplayHeight = 40;
double playerIconDisplayWidth = 40;

class PlaceholderCard extends StatelessWidget {
  const PlaceholderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        height: playerCardHeight,
        width: playerCardWidth,
        color: Colors.black.withOpacity(.1),
      ),
    );
  }
}
