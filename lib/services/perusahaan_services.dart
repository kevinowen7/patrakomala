part of 'services.dart';

class PerusahaanServies {
  static Future<ApiReturnValue<Bisnis>> getPerusahaan(int bisnisId,
      {http.Client client}) async {
    client ??= http.Client();

    var identifier = await UserServices.getDeviceDetails();

    String url = baseURL2 + 'mobile/perusahaan/detail';

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode({
          'bisnis_id': bisnisId,
          'identifier': identifier.message,
        }));

    print(identifier.message);
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'gagal');
    }

    var data = aConvert.jsonDecode(response.body);
    Bisnis value = Bisnis.fromJson(data['response']['perusahaan']);
    print('===== > ' + value.perusahaanNm);
    return ApiReturnValue(value: value);
  }
}
