import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/models/models.dart';
import 'package:patrakomala_neumorphic/services/services.dart';

part 'subsector_event.dart';
part 'subsector_state.dart';

class SubsectorBloc extends Bloc<SubsectorEvent, SubsectorState> {
  @override
  SubsectorState get initialState => SubsectorInitial();

  @override
  Stream<SubsectorState> mapEventToState(
    SubsectorEvent event,
  ) async* {
    if(event is FetchSubsector){
      List<Subsector> subsectors = await SubsectorServices.getSubsectors();
      yield SubsectorLoaded(subsector: subsectors);
    }
  }
}
