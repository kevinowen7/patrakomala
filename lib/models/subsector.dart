part of 'models.dart';

class Subsector extends Equatable {
  final int id;
  final String subSectorName;
  final String subSectorDescription;
  final String subSectorImg;
  final String subSectorSlug;

  Subsector({
    this.id,
    this.subSectorName,
    this.subSectorDescription,
    this.subSectorImg,
    this.subSectorSlug,
  });

  Subsector copyWith({
    int id,
    String subSectorName,
    String subSectorDescription,
    String subSectorImg,
    String subSectorSlug,
  }) =>
      Subsector(
        id: id ?? this.id,
        subSectorName: subSectorName ?? this.subSectorName,
        subSectorDescription: subSectorDescription ?? this.subSectorDescription,
        subSectorImg: subSectorImg ?? this.subSectorImg,
        subSectorSlug: subSectorSlug ?? this.subSectorSlug,
      );

  factory Subsector.fromJson(Map<String, dynamic> data) => Subsector(
    id : data['id'],
    subSectorName: data['sub_sector_name'],
    subSectorDescription: data['sub_sector'],
    subSectorImg: data['sub_sector_img'],
    subSectorSlug: data['sub_sector_slug'],
  );

  @override
  List<Object> get props =>
      [id, subSectorName, subSectorDescription, subSectorImg, subSectorSlug];
}
