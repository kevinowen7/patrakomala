import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/services/services.dart';
import 'package:patrakomala_neumorphic/models/models.dart';

part 'travel_package_event.dart';
part 'travel_package_state.dart';

class TravelPackageBloc extends Bloc<TravelPackageEvent, TravelPackageState> {
  @override
  TravelPackageState get initialState => TravelPackageInitial();
  @override
  Stream<TravelPackageState> mapEventToState(
    TravelPackageEvent event,
  ) async* {
    if (event is FetchTravelPackage) {
      ApiReturnValue<List<TravelPackage>> travelPackage =
          await KecamatanServices.getTravelPackage();
      yield (TravelPackageLoaded(travelPackage));
    }
  }
}
