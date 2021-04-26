part of 'travel_package_bloc.dart';

abstract class TravelPackageEvent extends Equatable {
  const TravelPackageEvent();
}

class FetchTravelPackage extends TravelPackageEvent {
  @override
  List<Object> get props => [];
}
