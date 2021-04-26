part of 'models.dart';

class Kelurahan extends Equatable {
  Kelurahan({
    this.id,
    this.subDistrictId,
    this.villageName,
    this.villageNameSlug,
    this.villagePostalCode,
  });

  final int id;
  final int subDistrictId;
  final String villageName;
  final String villageNameSlug;
  final String villagePostalCode;

  Kelurahan copyWith({
    int id,
    int subDistrictId,
    String villageName,
    String villageNameSlug,
    String villagePostalCode,
  }) =>
      Kelurahan(
        id: id ?? this.id,
        subDistrictId: subDistrictId ?? this.subDistrictId,
        villageName: villageName ?? this.villageName,
        villageNameSlug: villageNameSlug ?? this.villageNameSlug,
        villagePostalCode: villagePostalCode ?? this.villagePostalCode,
      );

  factory Kelurahan.fromJson(data) => Kelurahan(
        id: data['id'],
        subDistrictId: data['sub_district_id'],
        villageName: data['village_name'],
        villageNameSlug: data['village_name_slug'],
        villagePostalCode: data['village_postal_code'],
      );

  @override
  List<Object> get props => [
        id,
        subDistrictId,
        villageName,
        villageNameSlug,
        villagePostalCode,
      ];
}
