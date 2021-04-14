part of 'services.dart';

class ProvinsiServices {
  static Future<ApiReturnValue<List<Provinsi>>> getProvinsi(
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL2 + 'mobile/provinsi';
    var response = await client.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = aConvert.jsonDecode(response.body);
    List<Provinsi> provinsi = (data['response'] as Iterable)
        .map((e) => Provinsi.fromJson(e))
        .toList();

    return ApiReturnValue(value: provinsi);
  }

  static Future<ApiReturnValue<List<Kota>>> getKota(int idProvinsi,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + 'mobile/kota';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert
            .jsonEncode(<String, String>{'provinsi': idProvinsi.toString()}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = aConvert.jsonDecode(response.body);
    List<Kota> kota =
        (data['response'] as Iterable).map((e) => Kota.fromJson(e)).toList();

    return ApiReturnValue(value: kota);
  }
}
