import 'package:flappy_bird_game/Components/pipe.dart';
import 'package:flappy_bird_game/Game/configurations.dart';
import 'package:flappy_bird_game/Game/flappy_bird_game.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird_game/Game/obstacles.dart';
class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {

  PipeGroup();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x; // Start the pipe group at the right edge of the screen

    addAll([
      Pipe(pipePosition: PipePosition.up, height: 100), // Top pipe
      Pipe(pipePosition: PipePosition.bottom, height: 100), // Bottom pipe
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt; // Move the pipes to the left

  }
}
