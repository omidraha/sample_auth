import 'package:equatable/equatable.dart';

abstract class VerifyEvent extends Equatable {
  const VerifyEvent();

  @override
  List<Object> get props => [];
}

class UserSubmitVerificationCode extends VerifyEvent {}
