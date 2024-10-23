import 'package:flame/components.dart';
import 'package:flappy_bird_game/Game/assets.dart';
import 'package:flappy_bird_game/Game/configurations.dart';
import 'package:flappy_bird_game/Game/flappy_bird_game.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird_game/Game/obstacles.dart';


class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  final double height;
  final PipePosition pipePosition;

  Pipe({
    required this.pipePosition,
    required this.height,
  });

  @override
  Future<void> onLoad() async {
    // Load the pipe images
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);


    size = Vector2(50, height);
    // Set the sprite and position based on the pipePosition
    switch (pipePosition) {
      case PipePosition.up:
        position.y = 0;
        sprite = Sprite(pipeRotated);  // Assign the rotated sprite
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);  // Assign the regular sprite
        break;
    }


  }
}
