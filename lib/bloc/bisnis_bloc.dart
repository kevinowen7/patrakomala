import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/models/models.dart';
import 'package:patrakomala_neumorphic/services/services.dart';

part 'bisnis_event.dart';
part 'bisnis_state.dart';

class BisnisBloc extends Bloc<BisnisEvent, BisnisState> {
  @override
  BisnisState get initialState => BisnisInitial();

  @override
  Stream<BisnisState> mapEventToState(
    BisnisEvent event,
  ) async* {
    if(event is FetchBisnis){
      ApiReturnValue<Bisnis> bisnis = await PerusahaanServies.getPerusahaan(event.bisnisId);
      yield(BisnisLoaded(bisnis));
    }
  }
}
