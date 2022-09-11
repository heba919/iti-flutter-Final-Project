import 'package:flutter/material.dart';
import 'dart:collection';
import 'favInfo.dart';

class FavProvider with ChangeNotifier {
  List<FavInfo> _fav = [];

  UnmodifiableListView<FavInfo> get allfavmusic => UnmodifiableListView(_fav);

  void addatfav(String title, String img) {
    _fav.add(FavInfo(title: title, img: img));
    notifyListeners();
  }

  void deletefronfav(FavInfo fav) {
    _fav.remove(fav);
    notifyListeners();
  }
}
