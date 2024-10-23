import 'package:flame/components.dart';
import 'package:flame/parallax.dart';  
import 'package:flappy_bird_game/Game/assets.dart';
import 'package:flappy_bird_game/Game/flappy_bird_game.dart';
import 'package:flame/flame.dart';

class Ground extends ParallaxComponent<FlappyBirdGame> {
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
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Add any custom logic here for updating the parallax
  }
}
