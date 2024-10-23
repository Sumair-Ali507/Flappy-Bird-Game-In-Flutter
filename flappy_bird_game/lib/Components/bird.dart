import 'package:flame/components.dart';
import 'package:flappy_bird_game/Game/assets.dart';
import 'package:flappy_bird_game/Game/bird_movements.dart';
import 'package:flappy_bird_game/Game/flappy_bird_game.dart';


class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBirdGame> {
  Bird();

  @override
  Future<void> onLoad() async {
    //await super.onLoad(); // Ensure you call this

    // Load bird sprite images
    final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);

    // Set the sprites before accessing current
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap,
    };
    current = BirdMovement.middle;
    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2); // Center the bird vertically
  }
}
