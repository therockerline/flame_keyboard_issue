import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flameTest/src/components/actors/player/player.dart';
import 'package:flameTest/src/game/main_game_controller.dart';

class PlayerController{
  Player player;
  PlayerController(){
    double x = GameController.screenSize.width/2;
    double y = GameController.screenSize.height - 25;
    player = Player(Vector2)
  }

  void render(Canvas canvas) {

  }

  void update(double t) {
    enemies.forEach((Enemy enemy) => enemy.update(t));
  }

  void spawnEnemy(Vector2 pos) {
    enemies.add(Enemy(pos, Size.square(16)));
  }
}