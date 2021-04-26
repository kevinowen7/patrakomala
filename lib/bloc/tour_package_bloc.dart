import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/models/models.dart';
import 'package:patrakomala_neumorphic/services/services.dart';

part 'tour_package_event.dart';
part 'tour_package_state.dart';

class TourPackageBloc extends Bloc<TourPackageEvent, TourPackageState> {
  @override
  TourPackageState get initialState => TourPackageInitial();

  @override
  Stream<TourPackageState> mapEventToState(
    TourPackageEvent event,
  ) async* {
    if (event is FetchTourPackage) {
      ApiReturnValue<List<BeltPackage>> beltPackage =
          await KecamatanServices.getTourPackage();
      yield (TourPackageLoaded(beltPackage));
    }
  }
}
