import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:sample_auth/repository/user_repository.dart';
import 'init_event.dart';
import 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  final UserRepository userRepository;

  InitBloc({this.userRepository}) : super(AppIsLoading());

  @override
  Stream<InitState> mapEventToState(InitEvent event) async* {
    print('InitBloc.mapEventToState: $event');
    // Load user
    if (event == LoadUser()) {
      yield UserIsLoading();
      String user = await userRepository.getUser();
      if (user == null) {
        yield UserIsNotExist();
      } else {
        yield UserVerified();
      }
    }
  }
}
