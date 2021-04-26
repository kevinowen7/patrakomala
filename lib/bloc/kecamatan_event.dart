part of 'kecamatan_bloc.dart';

abstract class KecamatanEvent extends Equatable {
  const KecamatanEvent();
}


class FetchKecamatan extends KecamatanEvent {
  @override
  List<Object> get props => [];
}
