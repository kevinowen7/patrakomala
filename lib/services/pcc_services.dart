part of 'services.dart';

class PccServices {
  static Future<ApiReturnValue<List<PccModel>>> getPcc(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/pcc';
    var response =
        await client.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal mengambil data");
    }

    var data = aConvert.jsonDecode(response.body);
    List<PccModel> pcc = (data['response']['data'] as Iterable)
        .map((e) => PccModel.fromJson(e))
        .toList();

    return ApiReturnValue(value: pcc);
  }

  static Future<ApiReturnValue<List<PccModel>>> filterPcc(String title,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/pcc/filter';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode({
          'title': title,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal mengambil data");
    }

    var data = aConvert.jsonDecode(response.body);
    // print(data['response']['data'].length.toString());
    List<PccModel> pcc = (data['response']['data'] as Iterable)
        .map((e) => PccModel.fromJson(e))
        .toList();

    return ApiReturnValue(value: pcc);
  }

  static Future<ApiReturnValue<List<AboutPcc>>> getAboutPcc(
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL2 + 'mobile/about-pcc';
    var response = await client.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    print(response.statusCode.toString());

    var data = aConvert.jsonDecode(response.body);
    List<AboutPcc> aboutPcc =
        (data as Iterable).map((e) => AboutPcc.fromJson(e)).toList();

    return ApiReturnValue(value: aboutPcc);
  }
}
