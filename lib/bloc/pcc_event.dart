part of 'pcc_bloc.dart';

abstract class PccEvent extends Equatable {
  const PccEvent();
}

class FetchPcc extends PccEvent {
  @override
  List<Object> get props => [];
}
