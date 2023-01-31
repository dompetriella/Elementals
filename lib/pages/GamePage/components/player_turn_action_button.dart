import 'package:flutter/material.dart';

class PlayerTurnActionButton extends StatelessWidget {
  final String text;
  const PlayerTurnActionButton(
      {Key? key, required this.theme, required this.text})
      : super(key: key);

  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [theme.primary, Colors.black]),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 3),
                      color: Colors.grey.shade800)
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Center(
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(
                      fontSize: 18,
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
