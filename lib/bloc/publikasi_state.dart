part of 'publikasi_bloc.dart';

abstract class PublikasiState extends Equatable {
  const PublikasiState();
}

class PublikasiInitial extends PublikasiState {
  @override
  List<Object> get props => [];
}

class PublikasiLoaded extends PublikasiState {
  final ApiReturnValue<List<Publikasi>> publikasi;
  PublikasiLoaded(this.publikasi);
  @override
  List<Object> get props => [publikasi];
}
class PublikasiFilterLoaded extends PublikasiState {
  final ApiReturnValue<List<Publikasi>> publikasi;
  PublikasiFilterLoaded(this.publikasi);
  @override
  List<Object> get props => [publikasi];
}
