part of 'services.dart';

class PccServices {
  static Future<ApiReturnValue<List<PccModel>>> getPcc(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/pcc';
    var response =
        await client.get(url, headers: {"Content-Type": "application/json"});

    print('pcc === ' + response.statusCode.toString());

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal mengambil data");
    }

    var data = aConvert.jsonDecode(response.body);
    List<PccModel> pcc =
        (data['response']['data'] as Iterable).map((e) => PccModel.fromJson(e)).toList();

    return ApiReturnValue(value: pcc);
  }
}
