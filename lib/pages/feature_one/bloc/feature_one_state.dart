import 'package:equatable/equatable.dart';

abstract class FeatureOneState extends Equatable {
  const FeatureOneState();

  @override
  List<Object> get props => [];
}

class AppIsLoading extends FeatureOneState {
  const AppIsLoading();
}
