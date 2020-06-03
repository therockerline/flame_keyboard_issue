import 'dart:async';
import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flameTest/src/components/base/mixins/move_able.dart';
import 'file:///C:/Users/loren/AndroidStudioProjects/flameTest/lib/src/components/base/mixins/hit_able.dart';
import 'package:flameTest/src/components/base/spritable.dart';
import 'package:flameTest/src/game/main_game_controller.dart';

class Player extends Spritable with HitAble, MoveAble{
  int totalLife = 0;
  int currentLife = 0;

  Player(Vector2 initialPosition, Size tileSize, {Vector2 pivot}) : super(initialPosition: initialPosition, spritePath: 'assets/images/player.png'  ){
    listeners.add(GameController.tapEvent.stream.listen((offset) {

    }));
  }

  void update(double t) {

  }

  void die() {
    currentLife = 0;
    destroy();
  }

}