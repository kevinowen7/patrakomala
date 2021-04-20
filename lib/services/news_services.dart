part of 'services.dart';

class NewsServices {
  static Future<ApiReturnValue<List<News>>> getNews({http.Client client}) async {
    client ??=  http.Client();

    String url = baseURL2 + 'api/mobile/news';
    var response = await client.get(url,headers:{'Content-Type' : 'apllication/json'});


    if(response.statusCode != 200){
      return ApiReturnValue(message:'Gagal mengambil data');
    }

    var data = aConvert.jsonDecode(response.body);
    List<News> news = (data['response'] as Iterable)
        .map((e) => News.fromMap(e))
        .toList();

    return ApiReturnValue(value : news);
  }
}