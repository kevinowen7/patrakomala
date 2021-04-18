part of 'bisnis_bloc.dart';

abstract class BisnisEvent extends Equatable {
  const BisnisEvent();
}

class FetchBisnis extends BisnisEvent{
  final int bisnisId;
  FetchBisnis(this.bisnisId);
  @override
  List<Object> get props => [bisnisId];
}
