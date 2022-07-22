class Response<A> {
  A? object;
  String message;
  bool error;
  Response({this.object, required this.message, this.error = false});
}