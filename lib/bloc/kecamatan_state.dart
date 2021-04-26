part of 'kecamatan_bloc.dart';

abstract class KecamatanState extends Equatable {
  const KecamatanState();
}

class KecamatanInitial extends KecamatanState {
  @override
  List<Object> get props => [];
}

class KecamatanLoaded extends KecamatanState {
  final ApiReturnValue<List<Kecamatan>> kecamatan;
  KecamatanLoaded(this.kecamatan);
  @override
  List<Object> get props => [kecamatan];
}
