import 'package:elementals/pages/GamePage/game_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> routes = [
  GoRoute(
    path: 'game_page',
    builder: (BuildContext context, GoRouterState state) {
      return const GamePage();
    },
  ),
];
