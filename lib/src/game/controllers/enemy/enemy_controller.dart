import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flameTest/src/components/actors/enemy/enemy.dart';
import 'package:flameTest/src/game/main_game_controller.dart';

class EnemyController{
  List<Enemy> enemies = [];
  EnemyController(){
    int qnt = GameController.rand.nextInt(10);
    double x = (GameController.screenSize.width - 30) / qnt;
    List.generate(qnt, (index) => spawnEnemy(Vector2(index*x, 10)));
  }

  void render(Canvas canvas) {
    enemies.forEach((Enemy enemy) => enemy.render(canvas));
  }

  void update(double t) {
    enemies.forEach((Enemy enemy) => enemy.update(t));
  }

  void spawnEnemy(Vector2 pos) {
    enemies.add(Enemy(pos, Size.square(16)));
  }
}