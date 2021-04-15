part of 'subsector_bloc.dart';

abstract class SubsectorState extends Equatable {
  const SubsectorState();
}

class SubsectorInitial extends SubsectorState {
  @override
  List<Object> get props => [];
}

class SubsectorLoaded extends SubsectorState {
  final List<Subsector> subsector;

  SubsectorLoaded({this.subsector});
  @override
  List<Object> get props => [subsector];
}