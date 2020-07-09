import 'package:equatable/equatable.dart';

abstract class InitState extends Equatable {
  const InitState();

  @override
  List<Object> get props => [];
}

// App is loading
class AppIsLoading extends InitState {
  const AppIsLoading();
}

// User is loading
class UserIsLoading extends InitState {}

// User does not exist
class UserIsNotExist extends InitState {}

class UserVerified extends InitState {
  const UserVerified();
}
