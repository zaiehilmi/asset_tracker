import 'package:flutter/cupertino.dart';
import 'package:june/june.dart';

final applicationState = June.getState(ApplicationVM.new);

class ApplicationVM extends JuneState {
  Brightness _brightness = Brightness.light;

  Brightness get brightness => _brightness;

  set brightness(Brightness value) {
    _brightness = value;
    setState();
  }
}
