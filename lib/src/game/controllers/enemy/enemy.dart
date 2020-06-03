import 'dart:async';
import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flameTest/src/components/base/mixins/destroy_able.dart';
import 'package:flameTest/src/components/base/mixins/hit_able.dart';
import 'package:flameTest/src/components/base/spritable.dart';

class Enemy extends Spritable with HitAble,DestroyAble {
  Enemy(Vector2 initialPosition, Size tileSize, {Vector2 pivot}) : super(initialPosition: initialPosition, ){
    isAlive = true;
    spritePaint = Paint();
    spritePaint.color = Color(0xff6ab04c);
    spriteRect = Rect.fromLTWH(position.x,position.y,this.tileSize.width,this.tileSize.height);
  }
  int count = 0;
  void update(double t) {
  }

  bool isPressed(Offset tapPos){
    return spriteRect.contains(tapPos);
  }

  die() {
    spritePaint.color = Color(0x00ff0000);
    destroy();
  }

}