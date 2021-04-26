part of 'tour_package_bloc.dart';

abstract class TourPackageEvent extends Equatable {
  const TourPackageEvent();

}

class FetchTourPackage extends TourPackageEvent {
  @override
  List<Object> get props => [];
}
