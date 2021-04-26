import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/models/models.dart';
import 'package:patrakomala_neumorphic/services/services.dart';

part 'kecamatan_event.dart';
part 'kecamatan_state.dart';

class KecamatanBloc extends Bloc<KecamatanEvent, KecamatanState> {
  @override
  KecamatanState get initialState => KecamatanInitial();

  @override
  Stream<KecamatanState> mapEventToState(
    KecamatanEvent event,
  ) async* {
    if (event is FetchKecamatan) {
      ApiReturnValue<List<Kecamatan>> kecamatan =
          await KecamatanServices.getKecamatan();
      yield (KecamatanLoaded(kecamatan));
    }
  }
}
