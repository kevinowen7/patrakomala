part of 'publikasi_bloc.dart';

abstract class PublikasiEvent extends Equatable {
  const PublikasiEvent();
}

class FetchPublikasi extends PublikasiEvent{
  @override
  List<Object> get props => [];
}
class FilterPublikasi extends PublikasiEvent{
  final String title;
  FilterPublikasi(this.title);
  @override
  List<Object> get props => [title];
}