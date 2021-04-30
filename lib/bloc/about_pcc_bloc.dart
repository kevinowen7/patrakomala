import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patrakomala_neumorphic/models/models.dart';
import 'package:patrakomala_neumorphic/services/services.dart';

part 'about_pcc_event.dart';
part 'about_pcc_state.dart';

class AboutPccBloc extends Bloc<AboutPccEvent, AboutPccState> {
  @override
  AboutPccState get initialState => AboutPccInitial();

  @override
  Stream<AboutPccState> mapEventToState(
    AboutPccEvent event,
  ) async* {
    if(event is FetchAboutPcc){
      ApiReturnValue<List<AboutPcc>> aPcc = await PccServices.getAboutPcc();
      yield(AboutPccLoaded(aPcc));
    }
  }
}
