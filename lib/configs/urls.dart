import 'package:flutter_dotenv/flutter_dotenv.dart';

class Urls {

  static String scheme = "https";
  static String host = "api.themoviedb.org";
  static String basePath = "/3/movie";
  static String popularPath = "/popular";
  static String topRatedPath = "/top_rated";
  static String imagePath = "http://image.tmdb.org/t/p/w500";

  static Map<String, dynamic> getParameters() {
    return {
      "api_key": dotenv.env['API_KEY']
    };
  }

  static Uri getPopular() {
    return Uri(
      scheme: scheme,
      host: host,
      path: basePath + popularPath,
      queryParameters: getParameters()
    );
  }

  static Uri getTopRated() {
    return Uri(
      scheme: scheme,
      host: host,
      path: basePath + topRatedPath,
      queryParameters: getParameters()
    );
  }

  static String getImagePath(String image) {
    return "$imagePath$image";
  }

}