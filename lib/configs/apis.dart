import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_list/configs/urls.dart';
import 'package:movie_list/core/mvi.dart';
import 'package:movie_list/responses/results.dart';
import 'package:movie_list/screens/home/providers/movie_source.dart';

class Api {

  static Future<MviApi<ResultResponse>> items(MovieSourceType type) async {
    if(type == MovieSourceType.Popular) {
      return popular();
    }
    return topRated();
  }

  static Future<MviApi<ResultResponse>> popular() async {
    MviApi<ResultResponse> mvi = MviApi<ResultResponse>();
    try {
      http.Response response = await http.get(
          Urls.getPopular()
      ).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        mvi.successful(ResultResponse.fromJson(json.decode(response.body)));
      }
    } catch (error) {
      mvi.failure(error as Exception);
    }
    return mvi;
  }

  static Future<MviApi<ResultResponse>> topRated() async {
    MviApi<ResultResponse> mvi = MviApi<ResultResponse>();
    try {
      http.Response response = await http.get(
          Urls.getTopRated()
      ).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        mvi.successful(ResultResponse.fromJson(json.decode(response.body)));
      }
    } catch (error) {
      mvi.failure(error as Exception);
    }
    return mvi;
  }

}