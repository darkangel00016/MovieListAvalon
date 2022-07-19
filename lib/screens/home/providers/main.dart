import 'package:flutter/material.dart';
import 'package:movie_list/responses/movie.dart';

class MainProvider extends ChangeNotifier {

  late List<Movie> items;

  MainProvider() {
    items = [];
  }

  void setItems(List<Movie> value) {
    items.clear();
    items.addAll(value);
    notifyListeners();
  }

}