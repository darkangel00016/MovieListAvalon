import 'package:flutter/material.dart';
import 'package:movie_list/generated/l10n.dart';

class MovieSourceProvider extends ChangeNotifier {

  late MovieSourceType type = MovieSourceType.Popular;

  void toggle() {
    type = (type == MovieSourceType.Popular)?MovieSourceType.TopRated:MovieSourceType.Popular;
    notifyListeners();
  }

  String getTitle() {
    return type == MovieSourceType.Popular?S.current.popular:S.current.topRated;
  }

  bool isTopRated() {
    return type == MovieSourceType.TopRated;
  }

}

enum MovieSourceType {
  Popular,
  TopRated
}