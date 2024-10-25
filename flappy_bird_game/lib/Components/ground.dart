import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird_game/Game/assets.dart';
import 'package:flappy_bird_game/Game/configurations.dart';
import 'package:flappy_bird_game/Game/flappy_bird_game.dart';
import 'package:flame/flame.dart';
import 'package:flame/collisions.dart';


class Ground extends ParallaxComponent<FlappyBirdGame>with HasGameRef<FlappyBirdGame> {
  @override
  Future<void> onLoad() async {
    //await super.onLoad();
    final ground = await Flame.images.load(Assets.ground); // Load the ground image

    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(
          ground, fill: LayerFill.none
        )
      ),
    ]);

    add(
      RectangleHitbox(
        position: Vector2(0, gameRef.size.y - Config.groundHeight),
        size:  Vector2(gameRef.size.x, Config.groundHeight),

      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax ?.baseVelocity.x = Config.gameSpeed;
  }
}


