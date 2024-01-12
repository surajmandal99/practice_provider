import 'package:flutter/material.dart';

class FavProvider extends ChangeNotifier {
  final List<int> _favList = [];

  List<int> get favList => _favList;

  void addFav(int index) {
    _favList.add(index);
    notifyListeners();
  }

  void removeFav(int index) {
    _favList.remove(index);
    notifyListeners();
  }

  bool isFav(int index) {
    return _favList.contains(index);
  }
}
