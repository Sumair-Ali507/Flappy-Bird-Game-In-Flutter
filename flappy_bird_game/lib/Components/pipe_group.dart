import 'dart:math';

import 'package:flappy_bird_game/Components/pipe.dart';
import 'package:flappy_bird_game/Game/configurations.dart';
import 'package:flappy_bird_game/Game/flappy_bird_game.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird_game/Game/obstacles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround / 4);

    final centerY = spacing + _random.nextDouble() * (heightMinusGround - spacing);

    addAll([
      Pipe(pipePosition: PipePosition.up, height: centerY - spacing / 2), // Top pipe
      Pipe(pipePosition: PipePosition.bottom, height: heightMinusGround - (centerY + spacing / 2)), // Bottom pipe
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt; // Move the pipes to the left

    if (position.x < -10) {
      removeFromParent();
      updateScore();

    }

    if(game.isHit){
      removeFromParent();
      gameRef.isHit=false;

    }
  }

  void updateScore(){
    gameRef.bird.score+=1;

  }
}
