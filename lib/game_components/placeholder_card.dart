import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/globalProvider.dart';

double phoneHeight(var context) => MediaQuery.of(context).size.height;
double phoneWidth(var context) => MediaQuery.of(context).size.width;

class PlaceholderCard extends ConsumerWidget {
  const PlaceholderCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        height: ref.read(cardHeightP1),
        width: ref.read(cardHeightP1) * ref.read(cardWidthProportion),
        color: Colors.black.withOpacity(.1),
      ),
    );
  }
}
