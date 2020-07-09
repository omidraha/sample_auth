import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

// User is registering
class UserStartRegistering extends RegisterState {
  final String name;
  final String deliveryValue;

  const UserStartRegistering({this.name, this.deliveryValue});
}

class UserVerificationCodeSent extends RegisterState {
  const UserVerificationCodeSent();
}
