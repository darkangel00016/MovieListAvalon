import 'package:flutter/widgets.dart';
import 'package:movie_list/responses/movie.dart';
import 'package:movie_list/utils/messages.dart';
import 'package:provider/provider.dart';
import '../providers/main.dart';
import 'item.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> with Messages {

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (_, provider, __) {
        return provider.items.isEmpty?Container():ListView.builder(
            itemBuilder: (context, index) {
              Movie item = provider.items[index];
              return MovieItemWidget(item: item);
            },
            itemCount: provider.items.length
        );
      },
    );
  }
}