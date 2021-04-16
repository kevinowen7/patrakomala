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

  static Future<ApiReturnValue<List<MarketPlaceProduct>>> getMarketPlace(
      int productId,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'produk/detail';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode(<String, String>{
          'produk_id': productId,
        }));

    var data = aConvert.jsonDecode(response.body);
    List<MarketPlaceProduct> value = (data['response']['url'] as Iterable)
        .map((e) => MarketPlaceProduct.fromJson(e))
        .toList();

    return ApiReturnValue(value: value);
  }
}
