import 'dart:ui';

import 'package:flameTest/src/components/base/spritable.dart';

mixin HitAble on Spritable{
  bool wasHit(Offset shotPos){
    return spriteRect.contains(shotPos);
  }
}