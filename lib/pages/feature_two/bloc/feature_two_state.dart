import 'package:equatable/equatable.dart';

abstract class FeatureTwoState extends Equatable {
  const FeatureTwoState();

  @override
  List<Object> get props => [];
}

class DataIsLoading extends FeatureTwoState {
  @override
  List<Object> get props => [];
}

class DataLoaded extends FeatureTwoState {
  final String data;

  DataLoaded({this.data});

  @override
  List<Object> get props => [data];
}
