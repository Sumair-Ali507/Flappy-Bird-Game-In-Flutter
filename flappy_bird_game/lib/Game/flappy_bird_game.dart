import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird_game/Components/background.dart';
import 'package:flappy_bird_game/Components/bird.dart';
import 'package:flappy_bird_game/Components/ground.dart';
import 'package:flappy_bird_game/Components/pipe_group.dart';
import 'package:flappy_bird_game/Game/configurations.dart';
import 'package:flame/timer.dart';
import 'package:flame/events.dart';
import 'package:flame/components.dart';

class FlappyBirdGame extends FlameGame with TapDetector , HasCollisionDetection{
  late TextComponent score;

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;


  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score =buildScore(),
    ]);


    interval.onTick = () => add(PipeGroup());

  }

  TextComponent buildScore(){
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x/2, size.y/2 *0.2),
      anchor: Anchor.center,
    );

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

    score.text = 'Score: ${bird.score}';

  }
}
