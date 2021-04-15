part of 'services.dart';

class SubsectorServices {
  static Future<List<Subsector>> getSubsectors({http.Client client}) async {
    client??= http.Client();

    String url = baseURL2 + 'v1/tenant/list-subsector';
    var response = await http.get(url, headers: {
      "Content-Type" : "application/json"
    });

    // if(response.statusCode != 200){
    //   // return 'gagal';
    // }

    var data = aConvert.jsonDecode(response.body);
    List<Subsector> subsectors = (data['data'] as Iterable).map((e) => Subsector.fromJson(e)).toList();

    return subsectors;
  }
}