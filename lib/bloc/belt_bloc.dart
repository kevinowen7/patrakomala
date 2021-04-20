import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'belt_event.dart';
part 'belt_state.dart';

class BeltBloc extends Bloc<BeltEvent, BeltState> {
  @override
  BeltState get initialState => BeltInitial();
  
  @override
  Stream<BeltState> mapEventToState(
    BeltEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
