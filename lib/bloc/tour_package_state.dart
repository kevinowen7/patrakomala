part of 'tour_package_bloc.dart';

abstract class TourPackageState extends Equatable {
  const TourPackageState();
}

class TourPackageInitial extends TourPackageState {
  @override
  List<Object> get props => [];
}

class TourPackageLoaded extends TourPackageState {
  final ApiReturnValue<List<BeltPackage>> beltPackage;
  TourPackageLoaded(this.beltPackage);
  @override
  List<Object> get props => [];
}
