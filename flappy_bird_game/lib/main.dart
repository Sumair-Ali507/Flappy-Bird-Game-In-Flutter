import 'package:flappy_bird_game/Game/flappy_bird_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(
    GameWidget(game: game), // Ensure that GameWidget is used properly
  );
}


