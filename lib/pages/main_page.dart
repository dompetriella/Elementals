import 'package:elementals/providers/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/enums.dart';

List<Color> getElementalGradient(ElementalType elementalType) {
  switch (elementalType) {
    case ElementalType.fire:
      return [Colors.red, Colors.black];
    case ElementalType.air:
      return [Colors.yellow.shade300, Colors.black];
    case ElementalType.water:
      return [Colors.blue, Colors.black];
    case ElementalType.earth:
      return [Colors.green, Colors.black];
  }
}

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
                colors:
                    getElementalGradient(ref.watch(playerElementProvider)))),
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
                    color: Colors.grey.shade200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0, horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Choose an Element",
                        style: TextStyle(fontSize: 24),
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
                        onTap: () => context.go('/game_page'),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: animationDuration),
                          width: 180,
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(-5, 5),
                                    color: getElementalGradient(
                                        ref.watch(playerElementProvider))[0])
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
    var chosenElement = ref.watch(playerElementProvider);
    return GestureDetector(
      onTap: () =>
          ref.watch(playerElementProvider.notifier).state = elementalType,
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
                    ? getElementalGradient(elementalType)
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
