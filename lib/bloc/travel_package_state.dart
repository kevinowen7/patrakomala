part of 'travel_package_bloc.dart';

abstract class TravelPackageState extends Equatable {
  const TravelPackageState();
}

class TravelPackageInitial extends TravelPackageState {
  @override
  List<Object> get props => [];
}

class TravelPackageLoaded extends TravelPackageState {
  final ApiReturnValue<List<TravelPackage>> travelPackage;
  TravelPackageLoaded(this.travelPackage);
  @override
  List<Object> get props => [travelPackage];
}
