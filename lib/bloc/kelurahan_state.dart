part of 'kelurahan_bloc.dart';

abstract class KelurahanState extends Equatable {
  const KelurahanState();

}

class KelurahanInitial extends KelurahanState {
  @override
  List<Object> get props => [];
}

class KelurahanLoaded extends KelurahanState{
  final ApiReturnValue<List<Kelurahan>> kelurahan;
  KelurahanLoaded(this.kelurahan);
  @override
  List<Object> get props => throw UnimplementedError();

}
