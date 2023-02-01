import 'package:elementals/providers/playerDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'components/opponent_side.dart';
import 'components/play_zone.dart';
import 'components/player_hand_area.dart';
import 'components/player_side.dart';
import 'components/settings_button.dart';

double phoneHeight(var context) => MediaQuery.of(context).size.height;
double phoneWidth(var context) => MediaQuery.of(context).size.width;

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Column(
          children: [
            Flexible(
              flex: 5,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          OpponentSideBackground(),
                          PlayerBackground(),
                        ],
                      ),
                      Column(
                        children: [
                          OpponentSide(),
                          PlayerSide(),
                        ],
                      ),
                    ],
                  ),
                  SettingsButton(),
                  Center(
                    child: PlayZone(),
                  )
                ],
              ),
            ),
            Flexible(flex: 3, child: PlayerHandArea())
          ],
        ),
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
      flex: 20,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white, width: 5)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  HexColor(
                      ref.watch(playerProvider).elementalType.secondaryColor),
                  HexColor(
                      ref.watch(playerProvider).elementalType.primaryColor),
                ])),
      ),
    );
  }
}

class OpponentSideBackground extends ConsumerWidget {
  const OpponentSideBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      flex: 20,
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
