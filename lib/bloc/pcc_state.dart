part of 'pcc_bloc.dart';

abstract class PccState extends Equatable {
  const PccState();
}

class PccInitial extends PccState {
  @override
  List<Object> get props => [];
}

class PccLoaded extends PccState {
  final ApiReturnValue<List<PccModel>> pcc;
  PccLoaded(this.pcc);
  @override
  List<Object> get props => [pcc];
}

class PccFilterLoaded extends PccState {
  final ApiReturnValue<List<PccModel>> pcc;
  PccFilterLoaded(this.pcc);
  @override
  List<Object> get props => [pcc];
}
