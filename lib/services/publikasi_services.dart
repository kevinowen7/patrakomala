part of 'services.dart';

class PublikasiServices {
  static Future<ApiReturnValue<List<Publikasi>>> getPublikasi({http.Client client}) async {
    client ??=  http.Client();

    String url = baseURL2 + 'mobile/publikasi';
    var response =
        await client.get(url, headers: {'Content-Type': 'apllication/json'});

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Gagal mengambil data');
    }

    var data = aConvert.jsonDecode(response.body);
    List<Publikasi> news = (data['response']['data'] as Iterable)
        .map((e) => Publikasi.fromJson(e))
        .toList();

    return ApiReturnValue(value: news);
  }
  static Future<ApiReturnValue<List<Publikasi>>> getPublikasiFilter(String title,{http.Client client}) async {
    client ??=  http.Client();

    String url = baseURL2 + 'mobile/publikasi/filter';
    var response =
        await client.post(url, headers: {'Content-Type': 'apllication/json'},body: aConvert.jsonEncode({
          "title" : title
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Gagal mengambil data');
    }

    var data = aConvert.jsonDecode(response.body);
    List<Publikasi> news = (data['response']['data'] as Iterable)
        .map((e) => Publikasi.fromJson(e))
        .toList();

    return ApiReturnValue(value: news);
  }
}