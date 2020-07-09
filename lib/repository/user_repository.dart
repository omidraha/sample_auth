import 'dart:async';

class UserRepository {
  // Sample model of user
  String user;
  bool isVerified = false;
  Future<String> getUser() async {
    return user;
  }

  Future<void> createUser() async {
    user = "USER";
  }

  Future<void> verifyUser() async {
    isVerified = true;
  }
}
