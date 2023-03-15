import 'package:flutter/material.dart';

class PlayerTurnActionButton extends StatelessWidget {
  final String text;
  final bool isAvailable;
  final bool isActive;
  const PlayerTurnActionButton(
      {Key? key,
      required this.theme,
      required this.text,
      required this.isAvailable,
      this.isActive = false})
      : super(key: key);

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: MediaQuery.of(context).size.width * .40,
        height: MediaQuery.of(context).size.width * .15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                isAvailable ? theme.primary : Colors.grey,
                isActive ? theme.secondary : theme.tertiary
              ]),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: theme.secondary,
                    spreadRadius: 2,
                    offset: Offset(0, 0))
                : BoxShadow(color: Colors.black.withOpacity(0.25)),
            !isActive
                ? BoxShadow(
                    color: theme.primary, spreadRadius: 2, offset: Offset(0, 3))
                : BoxShadow(color: Colors.transparent)
          ],
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
