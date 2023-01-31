import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/globalProvider.dart';

double phoneHeight(var context) => MediaQuery.of(context).size.height;
double phoneWidth(var context) => MediaQuery.of(context).size.width;

class PlaceholderCard extends ConsumerWidget {
  final bool isShrunk;
  const PlaceholderCard({super.key, this.isShrunk = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ref.read(cardSpacing) / 2),
      child: Container(
        height: ref.read(cardHeightP1) + ref.read(cardSpacing),
        width: ref.read(cardHeightP1) * ref.read(cardWidthProportion) +
            ref.read(cardSpacing),
        color: Colors.black.withOpacity(.1),
      ),
    );
  }
}
