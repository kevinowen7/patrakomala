part of 'services.dart';

class NewsServices {
  static Future<ApiReturnValue<List<News>>> getNews(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/news';
    var response =
        await client.get(url, headers: {'Content-Type': 'apllication/json'});

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Gagal mengambil data');
    }

    var data = aConvert.jsonDecode(response.body);
    List<News> news = (data['response']['data'] as Iterable)
        .map((e) => News.fromMap(e))
        .toList();

    return ApiReturnValue(value: news);
  }

  static Future<ApiReturnValue<List<News>>> getNewsFilter(String title,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/news/filter';
    var response = await client.post(url,
        headers: {'Content-Type': 'apllication/json'},
        body: aConvert.jsonEncode({
          'title': title,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Gagal mengambil data');
    }

    var data = aConvert.jsonDecode(response.body);
    List<News> news = (data['response']['data'] as Iterable)
        .map((e) => News.fromMap(e))
        .toList();

    return ApiReturnValue(value: news);
  }

  static Future<ApiReturnValue<News>> getNewsDetail(int newsId,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/news/detail';
    var response = await client.post(url,
        headers: {'Content-Type': 'apllication/json'},
        body: aConvert.jsonEncode({
          "id": newsId,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Gagal mengambil data');
    }

    var data = aConvert.jsonDecode(response.body);
    News news = News.fromMap(data['response']);

    return ApiReturnValue(value: news);
  }
}
