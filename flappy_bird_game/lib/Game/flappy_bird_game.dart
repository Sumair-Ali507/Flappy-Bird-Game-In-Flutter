import 'package:flame/game.dart';
import 'package:flappy_bird_game/Components/background.dart';
import 'package:flappy_bird_game/Components/bird.dart';
import 'package:flappy_bird_game/Components/ground.dart';
import 'package:flappy_bird_game/Components/pipe_group.dart';
class FlappyBirdGame extends FlameGame {
  late Bird bird;

  @override
  Future<void> onLoad () async{

    addAll([
    Background(),
    Ground(),
      bird=Bird(),
      PipeGroup(),

    ]);
  }
}