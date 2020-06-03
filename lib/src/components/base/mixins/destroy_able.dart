import 'package:flameTest/src/components/base/spritable.dart';

mixin DestroyAble on Spritable{
  bool isAlive;

  void destroy(){
    isAlive = false;
  }
}