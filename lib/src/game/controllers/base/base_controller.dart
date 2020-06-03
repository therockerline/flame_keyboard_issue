import 'dart:async';

class BaseController{
  List<StreamSubscription<dynamic>> listeners = [];

  void clearAll(){
    listeners.forEach((l) {l.cancel();});
  }

}