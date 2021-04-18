part of 'services.dart';

class ProductServices {
  static Future<ApiReturnValue<List<Product>>> getProduct(int page,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/produk?page=$page';
    var response = await client.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Gagal mengambil data');
    }

    var data = aConvert.jsonDecode(response.body);
    List<Product> products = (data['response']['data'] as Iterable)
        .map((e) => Product.fromJson(e))
        .toList();
    return ApiReturnValue(value: products);
  }

  static Future<ApiReturnValue<List<Product>>> filterProduct(
      int page, String produkName, List<String> subsector,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 +
        'mobile/produk?page=$page&product_name=$produkName&subsektor=$subsector';
    var response = await client.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Gagal mengambil data');
    }

    var data = aConvert.jsonDecode(response.body);
    List<Product> products = (data['response']['data'] as Iterable)
        .map((e) => Product.fromJson(e))
        .toList();
    return ApiReturnValue(value: products);
  }

  static Future<ApiReturnValue<List<MarketPlaceProduct>>> getMarketPlace(
      int productId,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/produk/detail';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode({
          'produk_id': productId,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Gagal');
    }

    var data = aConvert.jsonDecode(response.body);
    List<MarketPlaceProduct> value = (data['response']['url'] as Iterable)
        .map((e) => MarketPlaceProduct.fromJson(e))
        .toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<Bisnis>> getBisnis(int produkId,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/produk/detail';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode({
          'produk_id': produkId,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Gagal');
    }

    var data = aConvert.jsonDecode(response.body);
    if (data['response']['bisnis'] == null) {
      return ApiReturnValue(value: null);
    } else {
      Bisnis value = Bisnis.fromJson(data['response']['bisnis']);
      return ApiReturnValue(value: value);
    }
  }

  static Future<ApiReturnValue<List<Product>>> getProductBisnis(int bisnisId,
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

    // print(response.statusCode.toString());
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'gagal');
    }

    var data = aConvert.jsonDecode(response.body);
    List<Product> products = (data['response']['produk'] as Iterable)
        .map((e) => Product.fromJson(e))
        .toList();
    return ApiReturnValue(value: products);
  }
}
