import 'package:elementals/game_logic/logic.dart';
import 'package:elementals/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../models/player_data.dart';
import '../../../providers/playerDataProvider.dart';

double phoneHeight(var context) => MediaQuery.of(context).size.height;
double phoneWidth(var context) => MediaQuery.of(context).size.width;

double calculateFieldHeight(var context, WidgetRef ref, PlayerData player) {
  // get game area size, mediaquery.padding is safe area for mobile
  double totalGameFieldHeight =
      phoneHeight(context) * (gameField / (playerField + gameField)) -
          MediaQuery.of(context).padding.top;
  double heightUnit = totalGameFieldHeight / (winningScore * 2);
  return calculateOvertakeSize(player, ref) * heightUnit;
}

int duration = 400;
Curve curve = Curves.easeInOut;

class OpponentSideBackground extends ConsumerWidget {
  const OpponentSideBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: Duration(milliseconds: duration),
      curve: curve,
      height: calculateFieldHeight(context, ref, ref.watch(playerTwoProvider)),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            HexColor(ref.watch(playerTwoProvider).elementalType.primaryColor),
            HexColor(ref.watch(playerTwoProvider).elementalType.secondaryColor),
          ])),
    );
  }
}

class PlayerBackground extends ConsumerWidget {
  const PlayerBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: Duration(milliseconds: duration),
      curve: curve,
      height: calculateFieldHeight(context, ref, ref.watch(playerProvider)),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white, width: 2)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HexColor(
                    ref.watch(playerProvider).elementalType.secondaryColor),
                HexColor(ref.watch(playerProvider).elementalType.primaryColor),
              ])),
    );
  }
}
