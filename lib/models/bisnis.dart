part of 'models.dart';

class Bisnis extends Equatable {
  Bisnis({
    this.perusahaanNm,
    this.perusahaanNoTelp,
    this.perusahaanEmail,
    this.perusahaanLatitude,
    this.perusahaanLongitude,
    this.perusahaanAlamat,
    this.perusahaanKecamatan,
    this.perusahaanKelurahan,
    this.perusahaanRtrw,
    this.perusahaanKodepos,
    this.parking,
    this.toilet,
    this.mushola,
    this.showroom,
    this.bisnisId,
    this.perusahaanDesc,
    this.jamBuka,
    this.jamTutup,
    this.perusahaanLogo,
  });

  final String perusahaanNm;
  final String perusahaanNoTelp;
  final String perusahaanEmail;
  final String perusahaanLatitude;
  final String perusahaanLongitude;
  final String perusahaanAlamat;
  final int perusahaanKecamatan;
  final int perusahaanKelurahan;
  final dynamic perusahaanRtrw;
  final String perusahaanKodepos;
  final bool parking;
  final bool toilet;
  final bool mushola;
  final bool showroom;
  final int bisnisId;
  final String perusahaanDesc;
  final String jamBuka;
  final String jamTutup;
  final String perusahaanLogo;

  factory Bisnis.fromJson(Map<String, dynamic> data) => Bisnis(
        perusahaanNm: data['perusahaan_nm'],
        perusahaanNoTelp: data['perusahaan_no_telp'],
        perusahaanEmail: data['perusahaan_email'],
        perusahaanLatitude: data['perusahaan_latitude'],
        perusahaanLongitude: data['perusahaan_longitude'],
        perusahaanAlamat: data['perusahaan_alamat'],
        perusahaanKecamatan: data['perusahaan_kecamatan'],
        perusahaanKelurahan: data['perusahaan_kelurahan'],
        perusahaanRtrw: data['perusahaan_rtrw'],
        perusahaanKodepos: data['perusahaan_kodepos'],
        parking: data['parking'],
        toilet: data['toilet'],
        mushola: data['mushola'],
        showroom: data['showroom'],
        bisnisId: data['bisnis_id'],
        perusahaanDesc: data['perusahaan_desc'],
        jamBuka: data['jam_buka'],
        jamTutup: data['jam_tutup'],
        perusahaanLogo: data['perusahaan_logo'],
      );
  @override
  List<Object> get props => [
        perusahaanNm,
        perusahaanNoTelp,
        perusahaanEmail,
        perusahaanLatitude,
        perusahaanLongitude,
        perusahaanAlamat,
        perusahaanKecamatan,
        perusahaanKelurahan,
        perusahaanRtrw,
        perusahaanKodepos,
        parking,
        toilet,
        mushola,
        showroom,
        bisnisId,
        perusahaanDesc,
        jamBuka,
        jamTutup,
        perusahaanLogo,
      ];
}
