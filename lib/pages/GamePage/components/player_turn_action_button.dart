import 'package:flutter/material.dart';

class PlayerTurnActionButton extends StatelessWidget {
  final String text;
  final bool isActive;
  const PlayerTurnActionButton(
      {Key? key,
      required this.theme,
      required this.text,
      required this.isActive})
      : super(key: key);

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            constraints: BoxConstraints(maxHeight: 50, maxWidth: 150),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      isActive ? theme.primary : Colors.grey,
                      Colors.black
                    ]),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 2,
                      offset: Offset(0, 3),
                      color: Colors.black.withOpacity(0.25))
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Center(
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
