import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/models/models.dart';
import 'package:patrakomala_neumorphic/services/services.dart';

part 'provinsi_event.dart';
part 'provinsi_state.dart';

class ProvinsiBloc extends Bloc<ProvinsiEvent, ProvinsiState> {
  ProvinsiState get initialState => ProvinsiInitial();
  @override
  Stream<ProvinsiState> mapEventToState(
    ProvinsiEvent event,
  ) async* {
    if (event is LoadProvinsi) {
      ApiReturnValue<List<Provinsi>> provinsi =
          await ProvinsiServices.getProvinsi();
      yield ProvinsiLoaded(provinsi.value);
    }
  }
}
