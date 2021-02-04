import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/repository/user_repository.dart';
import 'feature_one_event.dart';
import 'feature_one_state.dart';

class FeatureOneBloc extends Bloc<FeatureOneEvent, FeatureOneState> {
  final UserRepository userRepository;

  FeatureOneBloc({this.userRepository}) : super(AppIsLoading());

  @override
  Stream<FeatureOneState> mapEventToState(FeatureOneEvent event) async* {
    print('FeatureOne.mapEventToState: $event');
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
