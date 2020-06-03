import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flameTest/src/game/main_game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.images.loadAll(<String>[
    "player.png"
  ]);
  var game = GameController();
  runApp(game.widget);

  var flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);

}