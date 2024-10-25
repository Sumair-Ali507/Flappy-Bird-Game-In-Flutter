import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird_game/Components/background.dart';
import 'package:flappy_bird_game/Components/bird.dart';
import 'package:flappy_bird_game/Components/ground.dart';
import 'package:flappy_bird_game/Components/pipe_group.dart';
import 'package:flappy_bird_game/Game/configurations.dart';
import 'package:flame/timer.dart';
import 'package:flame/events.dart';

class FlappyBirdGame extends FlameGame with TapDetector , HasCollisionDetection{
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;


  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
    ]);

    interval.onTick = () => add(PipeGroup());

  }


  @override
  void onTap(){
    super.onTap();
    bird.fly();
  }


  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);

  }
}
