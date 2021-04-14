part of 'models.dart';

class RegistrationData {
  String name;
  String email;
  int gender;
  int provinsi;
  int kota;
  DateTime tglLahir;
  String tempatLahir;
  String identifier;

  RegistrationData(
      {this.name = "",
      this.email = "",
      this.gender,
      this.provinsi,
      this.kota,
      this.tglLahir,
      this.tempatLahir,
      this.identifier});
}
