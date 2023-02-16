import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: -5,
      child: Center(
        child: GestureDetector(
          onTap: () => context.go('/'),
          child: Container(
            height: 70,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Theme.of(context).colorScheme.primary
                    ])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
            ),
          ),
        ),
      ),
    );
  }
}
