part of 'models.dart';

class Pentahelix extends Equatable {
  Pentahelix({
    this.id,
    this.namaKategori,
    this.status,
  });

  final int id;
  final String namaKategori;
  final int status;

  Pentahelix copyWith({
    int id,
    String namaKategori,
    int status,
  }) =>
      Pentahelix(
        id: id ?? this.id,
        namaKategori: namaKategori ?? this.namaKategori,
        status: status ?? this.status,
      );
  @override
  List<Object> get props => [
        id,
        namaKategori,
        status,
      ];
}
