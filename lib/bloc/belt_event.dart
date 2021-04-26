part of 'belt_bloc.dart';

abstract class BeltEvent extends Equatable {
  const BeltEvent();
}

class FetchBelt extends BeltEvent{
  @override
  List<Object> get props => [];
}

class BeltBySubsector extends BeltEvent{
  final List<int> subsector;
  BeltBySubsector(this.subsector);
  @override
  List<Object> get props => [subsector];
}