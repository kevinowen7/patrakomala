part of 'services.dart';

class AcaraServices {
  static Future<ApiReturnValue<List<Acara>>> getEvent(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/event';
    var response =
        await client.get(url, headers: {'Content-Type': 'apllication/json'});

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Gagal mengambil data');
    }

    var data = aConvert.jsonDecode(response.body);
    List<Acara> acara = (data['response']['data'] as Iterable)
        .map((e) => Acara.fromJson(e))
        .toList();

    return ApiReturnValue(value: acara);
  }
}