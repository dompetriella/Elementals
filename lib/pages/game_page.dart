import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Container(
          color: Colors.lightBlue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                enableFeedback: false,
              ),
              onPressed: () => context.go('/'),
              child: Text("Go back"),
            ),
          ),
        ),
      ),
    );
  }
}
