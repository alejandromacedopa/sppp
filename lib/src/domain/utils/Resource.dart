abstract class Resource<T> {}

class Initial extends Resource {}

class Loading extends Resource {}

class Success<T> extends Resource<T> {
  final T data;
  Success(this.data);
}

class Error<T> extends Resource<T> {
  final String message;
  Error(this.message);
}
