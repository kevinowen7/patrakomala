part of 'models.dart';

class RegistrationData {
 String name;
 int gender;
 String email;
 int provinsi;
 int kota;
 String tglLahir;
 String tempatLahir;
 String identifier;

  RegistrationData(
      {this.name,
      this.email,
      this.gender,
      this.provinsi,
      this.kota,
      this.tglLahir,
      this.tempatLahir,
      this.identifier});

}
