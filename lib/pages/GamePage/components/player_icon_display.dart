import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../globals.dart';

class PlayerIconDisplay extends ConsumerWidget {
  final IconData icon;
  final Color bgColor;
  final int points;
  const PlayerIconDisplay(
      {Key? key, required this.icon, required this.bgColor, this.points = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: playerIconDisplaySize,
        width: playerIconDisplaySize,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade900,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2))
            ],
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black, bgColor]),
            border: Border.all(color: Colors.white, width: 2)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
