import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  double _opacity = 1.0;
  double get opacity => _opacity;

  void setOpacity(double value) {
    _opacity = value;
    notifyListeners();
  }
}
