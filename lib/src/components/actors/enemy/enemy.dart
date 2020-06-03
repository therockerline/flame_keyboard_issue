import 'dart:async';
import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flameTest/src/components/base/mixins/hit_able.dart';
import 'package:flameTest/src/components/base/spritable.dart';
import 'package:flameTest/src/game/main_game_controller.dart';

class Enemy extends Spritable with HitAble {
  bool isAlive = true;

  Enemy(Vector2 initialPosition, Size tileSize, {Vector2 pivot}) : super(initialPosition: initialPosition, ){

  }

  void update(double t) {

  }

  bool isPressed(Offset tapPos){
    return spriteRect.contains(tapPos);
  }

  growUp() {
    if(isAlive)
      //flyRect = flyRect.inflate(2);
      return;
  }

  die() {
    spritePaint.color = Color(0xffff0000);
    isAlive = false;
    destroy();
  }

}