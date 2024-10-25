import 'package:flappy_bird_game/Game/flappy_bird_game.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_game/Screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(
    GameWidget(game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
      'mainMenu': (context, _) => MainMenuScreen(game: game),
      },
    ), // Ensure that GameWidget is used properly
  );
}


