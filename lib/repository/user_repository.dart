import 'dart:async';

class UserRepository {
  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 3));
    return "REMOTE DATA";
  }
}
