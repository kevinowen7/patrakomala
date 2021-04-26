import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/models/models.dart';
import 'package:patrakomala_neumorphic/services/services.dart';

part 'pcc_event.dart';
part 'pcc_state.dart';

class PccBloc extends Bloc<PccEvent, PccState> {
  
  @override
  PccState get initialState => PccInitial();

  @override
  Stream<PccState> mapEventToState(
    PccEvent event,
  ) async* {
    if(event is FetchPcc){
      ApiReturnValue<List<PccModel>> pcc = await PccServices.getPcc();
      yield(PccLoaded(pcc));
    }else if(event is FilterPcc){
      ApiReturnValue<List<PccModel>> pcc = await PccServices.filterPcc(event.title);
      yield(PccFilterLoaded(pcc));
    }
  }

}
