part of 'acara_bloc.dart';

abstract class AcaraEvent extends Equatable {
  const AcaraEvent();
}

class FetchAcara extends AcaraEvent{
  @override
  List<Object> get props => [];
}
