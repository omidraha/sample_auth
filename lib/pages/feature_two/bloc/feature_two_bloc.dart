import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:sample_auth/repository/user_repository.dart';
import 'feature_two_event.dart';
import 'feature_two_state.dart';

class FeatureTwoBloc extends Bloc<FeatureTwoEvent, FeatureTwoState> {
  final UserRepository userRepository;

  FeatureTwoBloc({this.userRepository}) : super(DataIsLoading());

  @override
  Stream<FeatureTwoState> mapEventToState(FeatureTwoEvent event) async* {
    print('FeatureTwo.mapEventToState: $event');
    if (event is LoadData) {
      yield DataIsLoading();
      String data = await userRepository.getData();
      yield DataLoaded(data: data);
    }
  }
}
