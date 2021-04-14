part of 'models.dart';

class Provinsi {
  int id;
  String nama;

  Provinsi({this.id, this.nama});

  factory Provinsi.fromJson(Map<String, dynamic> data) => Provinsi(
        id: data['id'],
        nama: data['nama'],
      );
}


