import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/models/models.dart';
import 'package:patrakomala_neumorphic/services/services.dart';

part 'kelurahan_event.dart';
part 'kelurahan_state.dart';

class KelurahanBloc extends Bloc<KelurahanEvent, KelurahanState> {
  @override
  KelurahanState get initialState => KelurahanInitial();
  @override
  Stream<KelurahanState> mapEventToState(
    KelurahanEvent event,
  ) async* {
    if (event is FetchKelurahan) {
      ApiReturnValue<List<Kelurahan>> kelurahan =
          await KecamatanServices.getKelurahan();
      yield (KelurahanLoaded(kelurahan));
    }
  }
}
