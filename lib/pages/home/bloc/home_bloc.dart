import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/repository/user_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;

  HomeBloc({this.userRepository}) : super(UserIsInHome());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    print('HomeBloc.mapEventToState: $event');
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
