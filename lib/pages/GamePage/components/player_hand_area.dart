import 'package:elementals/globals.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../game_logic/logic.dart';
import '../../../providers/playerDataProvider.dart';
import 'action_button_area.dart';
import 'dynamic_info_channel.dart';

class PlayerHandArea extends ConsumerWidget {
  const PlayerHandArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: theme.tertiary, boxShadow: [
        BoxShadow(
            offset: Offset(0, -2),
            color: Colors.black.withOpacity(.25),
            blurRadius: 10,
            spreadRadius: 6)
      ]),
      child: Column(children: [
        PlayerHandBoard(theme: theme),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfusionWell(theme: theme),
                ActionButtonArea(theme: theme),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class InfusionWell extends StatelessWidget {
  const InfusionWell({
    super.key,
    required this.theme,
  });

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: theme.tertiary,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: theme.tertiary.withOpacity(.85),
                      inset: true,
                      offset: const Offset(1.5, 2.5),
                      spreadRadius: 3)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, theme.tertiary]),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}

class PlayerHandBoard extends ConsumerWidget {
  const PlayerHandBoard({
    super.key,
    required this.theme,
  });

  final ColorScheme theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              color: theme.secondary.withOpacity(.75),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, -10),
                    spreadRadius: 5,
                    inset: true,
                    color: Colors.black.withOpacity(.45))
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 8, 15),
            child: Stack(
              children: [
                Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < cardsInHand; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: cardSpacing),
                          child: SizedBox(
                            height: cardHeightP1,
                            width: cardHeightP1 * cardWidthProportion,
                          ),
                        )
                    ]),
                Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: convertDataToCards(
                      ref.watch(playerProvider).hand,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
