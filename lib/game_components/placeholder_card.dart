import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../globals.dart';

double phoneHeight(var context) => MediaQuery.of(context).size.height;
double phoneWidth(var context) => MediaQuery.of(context).size.width;

class PlaceholderCard extends ConsumerWidget {
  final bool isShrunk;
  const PlaceholderCard({super.key, this.isShrunk = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: cardSpacing / 2),
      child: Container(
        height: isShrunk ? cardHeightP2 : cardHeightP1 + cardSpacing,
        width: isShrunk
            ? cardHeightP2 * cardWidthProportion
            : cardHeightP1 * cardWidthProportion + cardSpacing,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
      ),
    );
  }
}
