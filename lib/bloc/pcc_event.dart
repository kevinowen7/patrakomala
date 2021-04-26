part of 'pcc_bloc.dart';

abstract class PccEvent extends Equatable {
  const PccEvent();
}

class FetchPcc extends PccEvent {
  @override
  List<Object> get props => [];
}
class FilterPcc extends PccEvent {
  final String title;
  FilterPcc(this.title);
  @override
  List<Object> get props => [];
}
