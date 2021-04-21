import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/services/services.dart';
import 'package:patrakomala_neumorphic/models/models.dart';

part 'publikasi_event.dart';
part 'publikasi_state.dart';

class PublikasiBloc extends Bloc<PublikasiEvent, PublikasiState> {
  @override
  PublikasiState get initialState => PublikasiInitial();

  @override
  Stream<PublikasiState> mapEventToState(
    PublikasiEvent event,
  ) async* {
    if(event is FetchPublikasi){
      ApiReturnValue<List<Publikasi>> publikasi = await PublikasiServices.getPublikasi();
      yield(PublikasiLoaded(publikasi));
    }else if(event is FilterPublikasi){
      ApiReturnValue<List<Publikasi>> publikasi = await PublikasiServices.getPublikasiFilter(event.title);
      yield(PublikasiFilterLoaded(publikasi));
    }
  }
} 
