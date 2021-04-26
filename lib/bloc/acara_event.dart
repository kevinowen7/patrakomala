part of 'acara_bloc.dart';

abstract class AcaraEvent extends Equatable {
  const AcaraEvent();
}

class FetchAcara extends AcaraEvent{
  @override
  List<Object> get props => [];
}
class FilterAcara extends AcaraEvent{
  final String title;
  FilterAcara({this.title});
  @override
  List<Object> get props => [title];
}
