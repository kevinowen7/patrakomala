part of 'belt_bloc.dart';

abstract class BeltState extends Equatable {
  const BeltState();
  

}

class BeltInitial extends BeltState {
    @override
  List<Object> get props => [];
}

class BeltLoaded extends BeltState {
  final ApiReturnValue<List<Belt>> belts;
  BeltLoaded(this.belts);
    @override
  List<Object> get props => [belts];
}

class BeltSubsectorLoaded extends BeltState {
  final ApiReturnValue<List<Belt>> belts;
  BeltSubsectorLoaded(this.belts);
    @override
  List<Object> get props => [belts];
}
