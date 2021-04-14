part of 'provinsi_bloc.dart';

abstract class ProvinsiState extends Equatable {
  const ProvinsiState();

  @override
  List<Object> get props => [];
}

class ProvinsiInitial extends ProvinsiState {}

class ProvinsiLoaded extends ProvinsiState {
  final List<Provinsi> provinsi;
  ProvinsiLoaded(this.provinsi);
  @override
  List<Object> get props => [provinsi];
}
