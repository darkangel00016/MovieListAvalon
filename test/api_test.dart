import 'dart:convert';

import 'package:movie_list/core/mvi.dart';
import 'package:movie_list/responses/results.dart';
import 'package:test/test.dart';

void main() {

  ResultResponse successResponse = ResultResponse.fromJson(json.decode('{"page":1,"results":[{"adult":false,"backdrop_path":"/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg","genre_ids":[10751,16,12,35,14],"id":438148,"original_language":"en","original_title":"Minions: The Rise of Gru","overview":"A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.","popularity":11510.186,"poster_path":"/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg","release_date":"2022-06-29","title":"Minions: The Rise of Gru","video":false,"vote_average":7.6,"vote_count":391}],"total_pages":34373,"total_results":687446}'));

  Exception exception = Exception("Error");

  test('Si se envia la respuesta de exito', () async {
    MviApi<ResultResponse> mviApi = MviApi<ResultResponse>();
    mviApi.successful(successResponse);
    expect(MviApiIntents.SUCCESS, mviApi.intent);
  });

  test('Si se envia la respuesta de error', () async {
    MviApi<ResultResponse> mviApi = MviApi<ResultResponse>();
    mviApi.failure(exception);
    expect(MviApiIntents.FAILURE, mviApi.intent);
  });

  test('Si no se asigna ninguna respuesta de exito o error conocida', () async {
    MviApi<ResultResponse> mviApi = MviApi<ResultResponse>();
    expect(MviApiIntents.UNKNOWN, mviApi.intent);
  });
}