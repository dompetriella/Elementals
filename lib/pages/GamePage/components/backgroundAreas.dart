import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../game_logic/logic.dart';
import '../../../providers/playerDataProvider.dart';
import '../game_page.dart';

class OpponentSideBackground extends ConsumerWidget {
  const OpponentSideBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      fit: FlexFit.tight,
      flex: calculateOvertakeSize(ref.watch(playerTwoProvider), ref),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              HexColor(ref.watch(playerTwoProvider).elementalType.primaryColor),
              HexColor(
                  ref.watch(playerTwoProvider).elementalType.secondaryColor),
            ])),
      ),
    );
  }
}

class PlayerBackground extends ConsumerWidget {
  const PlayerBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      fit: FlexFit.tight,
      flex: calculateOvertakeSize(ref.watch(playerProvider), ref),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              HexColor(ref.watch(playerProvider).elementalType.secondaryColor),
              HexColor(ref.watch(playerProvider).elementalType.primaryColor),
            ])),
      ),
    );
  }
}
