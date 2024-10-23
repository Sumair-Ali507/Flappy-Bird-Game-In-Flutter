import 'package:flame/game.dart';
import 'package:flappy_bird_game/Components/background.dart';
class FlappyBirdGame extends FlameGame {
  // Your game logic here
  @override
  Future<void> onLoad () async{
    add(Background());
    
  }
}