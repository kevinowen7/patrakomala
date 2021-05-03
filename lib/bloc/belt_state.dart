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

class BeltKecamatanLoaded extends BeltState {
  final ApiReturnValue<List<Belt>> belts;
  BeltKecamatanLoaded(this.belts);
  @override
  List<Object> get props => [belts];
}

class TourPackagesLoaded extends BeltState {
  final ApiReturnValue<List<Belt>> belts;
  TourPackagesLoaded(this.belts);
  @override
  List<Object> get props => [belts];
}

class Filter3Loaded extends BeltState {
  final ApiReturnValue<List<Belt>> belts;
  Filter3Loaded(this.belts);
  @override
  List<Object> get props => [belts];
}
