part of 'kelurahan_bloc.dart';

abstract class KelurahanEvent extends Equatable {
  const KelurahanEvent();

}

class FetchKelurahan extends KelurahanEvent{
  @override
  List<Object> get props => [];
}
