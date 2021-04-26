part of 'models.dart';

class Kecamatan extends Equatable {
  Kecamatan({
    this.id,
    this.kecamatan,
    this.slug,
  });

  final int id;
  final String kecamatan;
  final String slug;

  Kecamatan copyWith({
    int id,
    String kecamatan,
    String slug,
  }) =>
      Kecamatan(
        id: id ?? this.id,
        kecamatan: kecamatan ?? this.kecamatan,
        slug: slug ?? this.slug,
      );

  factory Kecamatan.fromJson(data) => Kecamatan(
        id: data['id'],
        kecamatan: data['kecamatan'],
        slug: data['slug'],
      );

  @override
  List<Object> get props => [
        this.id,
        this.kecamatan,
        this.slug,
      ];
}
