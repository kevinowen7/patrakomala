part of 'acara_bloc.dart';

abstract class AcaraState extends Equatable {
  const AcaraState();

}

class AcaraInitial extends AcaraState {
  @override
  List<Object> get props => [];
}

class AcaraLoaded extends AcaraState {
  final ApiReturnValue<List<Acara>> acara;
  AcaraLoaded(this.acara);
  @override
  List<Object> get props => [acara];
}

class AcaraFilterLoaded extends AcaraState {
  final ApiReturnValue<List<Acara>> acara;
  AcaraFilterLoaded(this.acara);
  @override
  List<Object> get props => [acara];
}
