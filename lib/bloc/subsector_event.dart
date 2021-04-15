part of 'subsector_bloc.dart';

abstract class SubsectorEvent extends Equatable {
  const SubsectorEvent();
}

class FetchSubsector extends SubsectorEvent{
  @override
  List<Object> get props => [];
}
