import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird_game/Components/background.dart';
import 'package:flappy_bird_game/Components/bird.dart';
import 'package:flappy_bird_game/Components/ground.dart';
import 'package:flappy_bird_game/Components/pipe_group.dart';
import 'package:flappy_bird_game/Game/configurations.dart';
import 'package:flame/timer.dart';

class FlappyBirdGame extends FlameGame {
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

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
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}
