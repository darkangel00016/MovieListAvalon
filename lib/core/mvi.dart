class MviApi<T> {

  T? data;
  MviApiIntents intent = MviApiIntents.UNKNOWN;
  Exception? error;

  void successful(T data) {
    this.data = data;
    error = null;
    intent = MviApiIntents.SUCCESS;
  }

  void failure(Exception e) {
    error = e;
    data = null;
    intent = MviApiIntents.FAILURE;
  }

  T getData() {
    return data!;
  }

}

enum MviApiIntents {

  SUCCESS,
  FAILURE,
  UNKNOWN

}