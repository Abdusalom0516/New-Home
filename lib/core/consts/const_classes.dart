class Success<T> {
  int statusCode;
  T data;

  Success({required this.statusCode, required this.data});
}


class Failure {
  final String message;

  Failure({required this.message});
}

