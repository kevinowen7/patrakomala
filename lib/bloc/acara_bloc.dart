import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/models/models.dart';
import 'package:patrakomala_neumorphic/services/services.dart';

part 'acara_event.dart';
part 'acara_state.dart';

class AcaraBloc extends Bloc<AcaraEvent, AcaraState> {
  @override
  AcaraState get initialState => AcaraInitial();
  
  @override
  Stream<AcaraState> mapEventToState(
    AcaraEvent event,
  ) async* {
    if(event is FetchAcara){
      ApiReturnValue<List<Acara>> acara = await AcaraServices.getEvent();
      yield(AcaraLoaded(acara));
    }else if (event is FilterAcara){
      ApiReturnValue<List<Acara>> acara = await AcaraServices.eventFilter(event.title);
      yield(AcaraFilterLoaded(acara));
    }
  }  
}
