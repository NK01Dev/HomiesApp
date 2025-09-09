class Failure {
  late String message;

  String get defaultMessage => "error_unknown";

  Failure({String? message}) {
    this.message = message ?? defaultMessage;
  }
}