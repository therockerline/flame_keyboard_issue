import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:box2d_flame/box2d.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flameTest/src/components/actors/bullet/bullet.dart';
import 'package:flameTest/src/components/scrappy_button.dart';
import 'package:flameTest/src/game/controllers/player/player_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'controllers/enemy/enemy_controller.dart';


class GameController extends Game with TapDetector, ForcePressDetector{
  //Size of the screen from the resize event
  static Size screenSize;
  static Random rand;
  static StreamController tapEvent = StreamController<Offset>.broadcast();
  EnemyController ec;
  PlayerController pc;
  double tileSize;


  GameController(){
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    rand = Random();
    pc = PlayerController();
    ec = EnemyController();
    pc.bulletStream.stream.listen((Bullet bullet) {
      if(bullet.isAlive)
        ec.checkCollision(bullet);
    });
  }

  @override
  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    ScrappyButton resetButton = ScrappyButton(screenSize.width-130, screenSize.height-30,Size(128,28));
    canvas.drawRect(bgRect, bgPaint);
    pc.render(canvas);
    ec.render(canvas);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width/9;
    super.resize(size);
  }

  @override
  void update(double t) {
    pc.update(t);
    ec.update(t);
  }

  void onTapDown(TapDownDetails d) {
    tapEvent.add(d.globalPosition);
  }


}