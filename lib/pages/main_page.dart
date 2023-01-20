import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Elementals",
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
                onPressed: () => context.go('/game_page'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50), enableFeedback: false),
                child: Text("Play"))
          ],
        ),
      ),
    );
  }
}
