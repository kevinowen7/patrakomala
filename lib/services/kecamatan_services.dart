part of 'services.dart';

class KecamatanServices {
  static Future<ApiReturnValue<List<Kecamatan>>> getKecamatan(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'v1/tenant/list-subdistrict';
    var response =
        await client.get(url, headers: {"Content-Type": "application/json"});

    print(response.statusCode.toString());

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal mengambil Kecamatan");
    }

    var data = aConvert.jsonDecode(response.body);
    List<Kecamatan> value =
        (data['data'] as Iterable).map((e) => Kecamatan.fromJson(e)).toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Kelurahan>>> getKelurahan(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/kelurahan';
    var response =
        await client.get(url, headers: {"Content-Type": "application/json"});

    print(response.statusCode.toString());

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal mengambil Kelurahan");
    }

    var data = aConvert.jsonDecode(response.body);
    List<Kelurahan> value = (data['response'] as Iterable)
        .map((e) => Kelurahan.fromJson(e))
        .toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<TravelPackage>>> getTravelPackage(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'v1/tour-package/list-package';
    var response =
        await client.get(url, headers: {"Content-Type": "application/json"});

    print('tp = ' + response.statusCode.toString());

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal mengambil tp");
    }

    var data = aConvert.jsonDecode(response.body);
    List<TravelPackage> value = (data['data'] as Iterable)
        .map((e) => TravelPackage.fromJson(e))
        .toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<BeltPackage>>> getTourPackage(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'v1/tour-package/list-belt';
    var response =
        await client.get(url, headers: {"Content-Type": "application/json"});

    print('tpb = ' + response.statusCode.toString());

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal mengambil tp");
    }

    var data = aConvert.jsonDecode(response.body);
    List<BeltPackage> value =
        (data['data'] as Iterable).map((e) => BeltPackage.fromJson(e)).toList();

    return ApiReturnValue(value: value);
  }
}
