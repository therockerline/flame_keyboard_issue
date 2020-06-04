import 'dart:ui';
import 'package:flame/anchor.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/keyboard.dart';
import 'package:flame/position.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyEvent{
  String key;
  bool isDown;
  KeyEvent(this.key, this.isDown);
  bool isEqual(KeyEvent ke){
    if(ke == null) return false;
    return ke.key==key && ke.isDown==isDown;
  }
  bool isNotEqual(KeyEvent ke){
    return !isEqual(ke);
  }
}

class GameController extends Game with KeyboardEvents{
  //Size of the screen from the resize event
  static Size screenSize;
  Rect aRect;
  Rect dRect;
  Rect bgRect;
  Color aColor = Colors.blue;
  Color dColor = Colors.blue;
  KeyEvent lastEvent;
  TextConfig config = TextConfig(fontSize: 48.0, fontFamily: 'Awesome Font');

  GameController(){
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    aRect = Rect.fromLTWH(100, 100, 50, 50);
    dRect = Rect.fromLTWH(300, 100, 50, 50);
    bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
  }

  @override
  void render(Canvas canvas) {
    //movable
    Paint paint = Paint();
    paint.color = Colors.white;
    canvas.drawRect(bgRect, paint);
    paint.color = aColor;
    canvas.drawRect(aRect, paint);
    config.render(canvas, "A", Position(125, 100), anchor: Anchor.topCenter);
    paint.color = dColor;
    canvas.drawRect(dRect, paint);
    config.render(canvas, "D", Position(325, 100), anchor: Anchor.topCenter);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  @override
  void update(double t) {

  }

  @override
  void onKeyEvent(RawKeyEvent e) {
    // TODO: implement onKeyEvent
    KeyEvent ev = KeyEvent(e.logicalKey.debugName, e is RawKeyDownEvent);
    //if(ev.isNotEqual(lastEvent)) {
    print([e,ev.key, ev.isDown, lastEvent?.key, lastEvent?.isDown]);
    if(ev.key == 'Key A') {
      aColor =  ev.isDown ? Colors.green :  Colors.blue;
    }
    if(ev.key == 'Key D'){
      dColor =  ev.isDown ?  Colors.green :  Colors.blue;
    }
    //lastEvent = ev;
    //}
  }

}