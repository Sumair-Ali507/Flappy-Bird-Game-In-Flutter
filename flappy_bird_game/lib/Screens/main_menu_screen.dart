import 'package:flappy_bird_game/Game/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:flappy_bird_game/Game/assets.dart';

class MainMenuScreen extends StatelessWidget{
  final FlappyBirdGame game;
  static const String id = "mainMenu";

  const MainMenuScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: (){
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/menu.jpg'),
              fit: BoxFit.cover,
            ),
          ),

          child: Image.asset('assets/images/message.png'),

        ),
      ),
    );
  }
}
