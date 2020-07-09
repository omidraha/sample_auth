import 'package:equatable/equatable.dart';

abstract class VerifyState extends Equatable {
  const VerifyState();

  @override
  List<Object> get props => [];
}

class UserIsVerifying extends VerifyState {
  const UserIsVerifying();
}

class UserVerified extends VerifyState {
  const UserVerified();
}
