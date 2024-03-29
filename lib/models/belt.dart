part of 'models.dart';

class Belt {
  Belt({
        this.id,
        this.latitude,
        this.longitude,
        this.tenantLogo,
        this.tenantName,
        this.alamat,
        this.noTelp,
        this.category,
        this.marker,
        this.subsector,
        this.kecamatan,
        this.kelurahan,
        this.toilet,
        this.parkir,
        this.mushola,
        this.showroom,
    });

    final int id;
    final String latitude;
    final String longitude;
    final String tenantLogo;
    final String tenantName;
    final String alamat;
    final String noTelp;
    final String category;
    final String marker;
    final String subsector;
    final int kecamatan;
    final int kelurahan;
    final bool toilet;
    final bool parkir;
    final bool mushola;
    final bool showroom;


    factory Belt.fromJson(Map<String, dynamic> json) => Belt(
        id: json["id"],
        latitude: json["latitude"] ,
        longitude: json["longitude"],
        tenantLogo: json["tenant_logo"],
        tenantName: json["tenant_name"],
        alamat: json["alamat"],
        noTelp: json["no_telp"],
        category: json["category"],
        marker: json["marker"],
        subsector: json["subsector"],
        kecamatan: json["kecamatan"],
        kelurahan: json["kelurahan"] == null ? null : json["kelurahan"],
        toilet: json['toilet'],
        parkir: json['parkir'],
        mushola: json['mushola'],
        showroom: json['showroom'],
    );

}