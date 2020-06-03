import 'dart:async';
import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flameTest/src/components/actors/bullet/bullet.dart';
import 'file:///C:/Users/LDC/StudioProjects/DartInvaders/lib/src/game/controllers/player/player.dart';
import 'package:flameTest/src/game/controllers/base/base_controller.dart';
import 'package:flameTest/src/game/main_game_controller.dart';

class PlayerController extends BaseController{
  Player player;
  List<Bullet> fired = [];
  StreamController<Bullet> bulletStream = StreamController<Bullet>.broadcast();

  PlayerController(){
    double x = GameController.screenSize.width/2;
    double y = GameController.screenSize.height - 100;
    player = Player(Vector2(x,y), Size(32,32));
    listeners.add(GameController.tapEvent.stream.listen((offset) {
      print('fire');
      spawnBullet();
    }));
  }

  void render(Canvas canvas) {
    player.render(canvas);
    fired.forEach((element) => element.render(canvas));
  }

  void update(double t) {
    player.update(t);
    fired.forEach((bullet) {
      if(bullet.isAlive) {
        bullet.update(t);
        bulletStream.add(bullet);
        if (bullet.position.y <= 0) {
          bullet.destroy();
        }
      }else{
        //fired.remove(bullet);
      }
    });
  }

  void spawnBullet() {
    fired.add(
        Bullet(
          Vector2(player.spriteRect.center.dx,player.spriteRect.center.dy),
          Vector2(0,-1),
          Size(4,4),
          velocity: 15.0,
        )
    );
  }
}