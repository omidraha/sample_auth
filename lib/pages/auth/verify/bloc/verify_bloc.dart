import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/repository/user_repository.dart';
import 'verify_event.dart';
import 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final UserRepository userRepository;

  VerifyBloc({this.userRepository}) : super(UserIsVerifying());

  @override
  Stream<VerifyState> mapEventToState(VerifyEvent event) async* {
    print('VerifyBloc.mapEventToState: $event');
    if (event == UserSubmitVerificationCode()) {
      await userRepository.verifyUser();
      yield UserVerified();
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
