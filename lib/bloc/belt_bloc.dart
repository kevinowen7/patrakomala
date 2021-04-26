import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/models/models.dart';
import 'package:patrakomala_neumorphic/services/services.dart';
part 'belt_event.dart';
part 'belt_state.dart';

class BeltBloc extends Bloc<BeltEvent, BeltState> {
  @override
  BeltState get initialState => BeltInitial();

  @override
  Stream<BeltState> mapEventToState(
    BeltEvent event,
  ) async* {
    if (event is FetchBelt) {
      ApiReturnValue<List<Belt>> belts = await MapServices.getBelt();
      yield (BeltLoaded(belts));
    } else if (event is BeltBySubsector) {
      ApiReturnValue<List<Belt>> belts =
          await MapServices.beltBySubsector(event.subsector);
      yield (BeltSubsectorLoaded(belts));
    }
  }
}
