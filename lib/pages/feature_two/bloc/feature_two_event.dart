import 'package:equatable/equatable.dart';

abstract class FeatureTwoEvent extends Equatable {
  const FeatureTwoEvent();

  @override
  List<Object> get props => [];
}

class LoadData extends FeatureTwoEvent {}
