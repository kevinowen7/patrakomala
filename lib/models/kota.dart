part of 'models.dart';

class Kota {
  int id;
  String provinsiId;
  String nama;

  Kota({this.id, this.provinsiId, this.nama});

  factory Kota.fromJson(Map<String, dynamic> data) => Kota(
        id: data['id'],
        provinsiId: data['provinsi_id'],
        nama: data['nama'],
      );
}
