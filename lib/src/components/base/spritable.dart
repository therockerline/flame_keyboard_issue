import 'dart:async';
import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/sprite.dart';
import 'package:flameTest/src/game/main_game_controller.dart';
import 'package:flutter/material.dart';

class Spritable{

  Vector2 _pivot = Vector2(.5,.5);
  Size _tileSize  = Size(16,16);
  Rect spriteRect;
  Paint spritePaint;
  Vector2 position;
  List<StreamSubscription<dynamic>> listeners = [];
  String spritePath;

  Spritable({@required Vector2 initialPosition, Size tileSize, Vector2 pivot, this.spritePath,}){
    _pivot = pivot ?? _pivot;
    _tileSize = tileSize ?? _tileSize;
    position = Vector2(initialPosition.x-(_tileSize.width*_pivot.x),initialPosition.y-(_tileSize.height*_pivot.y));
    spritePaint = Paint();
    spritePaint.color = Color(0xff6ab04c);
    spriteRect = Rect.fromLTWH(position.x,position.y,_tileSize.width,_tileSize.height);
  }

  void render(Canvas c) {
    c.drawRect(spriteRect, spritePaint);
  }

  void destroy(){
    listeners.forEach((l) {l.cancel();});
  }

  Size get tileSize => _tileSize;
  Vector2 get pivot => _pivot;
}