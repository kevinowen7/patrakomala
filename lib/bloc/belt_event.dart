part of 'belt_bloc.dart';

abstract class BeltEvent extends Equatable {
  const BeltEvent();
}

class FetchBelt extends BeltEvent{
  @override
  List<Object> get props => [];
}