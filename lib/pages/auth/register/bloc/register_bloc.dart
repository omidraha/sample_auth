import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/repository/user_repository.dart';

import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;

  RegisterBloc({this.userRepository}) : super(UserStartRegistering());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    print('RegisterBloc.mapEventToState: $event');
    if (event == UserSubmitRegistration()) {
      await userRepository.createUser();
      yield UserVerificationCodeSent();
    }
  }
}
