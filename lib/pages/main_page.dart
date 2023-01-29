import 'dart:math';
import 'package:elementals/game_logic/startup.dart';
import 'package:elementals/providers/gameDataProvider.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:elementals/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/enums.dart';

var animationDuration = 400;

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: animationDuration),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                colors: [Theme.of(context).colorScheme.primary, Colors.black])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  "Elementals",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200.withOpacity(.25)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0, horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Choose an Element",
                        style: TextStyle(fontSize: 24, color: Colors.white70),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          direction: Axis.horizontal,
                          children: [
                            ElementSelectButton(
                              elementalType: ElementalType.fire,
                            ),
                            ElementSelectButton(
                              elementalType: ElementalType.air,
                            ),
                            ElementSelectButton(
                              elementalType: ElementalType.water,
                            ),
                            ElementSelectButton(
                              elementalType: ElementalType.earth,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go('/game_page');
                          setInitalGameProperties(ref);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: animationDuration),
                          width: 180,
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(-5, 5),
                                    color:
                                        Theme.of(context).colorScheme.primary)
                              ],
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: Center(
                              child: Text(
                            'Play',
                            style: TextStyle(fontSize: 32),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ElementSelectButton extends ConsumerWidget {
  final ElementalType elementalType;
  const ElementSelectButton({super.key, required this.elementalType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var chosenElement = ref.watch(playerProvider).elementalType;
    return GestureDetector(
      onTap: () {
        ref.watch(playerProvider.notifier).changePlayerElement(elementalType);
        updateThemeToElement(ref);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: animationDuration),
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: chosenElement == elementalType
                    ? [Theme.of(context).colorScheme.primary, Colors.black]
                    : [Colors.transparent, Colors.transparent]),
            boxShadow: [
              chosenElement != elementalType
                  ? BoxShadow(offset: Offset(-5, 5), color: Colors.grey)
                  : BoxShadow()
            ],
            border: Border.all(color: Colors.black, width: 2)),
        child: Center(
            child: Text(
          elementalType.name.toUpperCase(),
          style: TextStyle(
              fontSize: 24,
              color:
                  chosenElement == elementalType ? Colors.white : Colors.black),
        )),
      ),
    );
  }
}
