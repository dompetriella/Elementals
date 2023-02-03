import 'package:elementals/providers/dynamicInfoProvider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../globals.dart';

class DynamicInfoChannel extends ConsumerWidget {
  const DynamicInfoChannel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: cardHeightP1 * cardWidthProportion * 4.5,
      height: 80,
      color: Colors.grey.shade900,
      child: Center(
        child: Text(
          ref.watch(dynamicInfoProvider),
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
