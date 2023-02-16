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
            color: Colors.grey.shade900,
            blurRadius: 10,
            spreadRadius: 2)
      ]),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
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
                DynamicInfoChannel(),
              ],
            ),
            ActionButtonArea(theme: theme),
          ]),
    );
  }
}
