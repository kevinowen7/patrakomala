part of 'bisnis_bloc.dart';

abstract class BisnisState extends Equatable {
  const BisnisState();
}

class BisnisInitial extends BisnisState {
  @override
  List<Object> get props => [];
}

class BisnisLoaded extends BisnisState {
  final ApiReturnValue<Bisnis> bisnis;
  BisnisLoaded(this.bisnis);
  @override
  List<Object> get props => [bisnis];
}
